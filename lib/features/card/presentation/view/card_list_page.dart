import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/card/presentation/bloc/remote/card/card_bloc.dart';
import 'package:sample/features/card/presentation/widgets/card_grid.dart';
import 'package:sample/features/card/presentation/widgets/search_bar.dart';
import 'package:sample/main.dart';

class CardListPage extends StatefulWidget {
  const CardListPage({super.key});

  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<CardBloc>().add(const FetchCardEvent("1"));
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      final currentPage = context.read<CardBloc>().state.currentPage;
      context.read<CardBloc>().add(FetchCardEvent(currentPage.toString()));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Cards'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SearchBarWidget(),
        ),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state.isLoading && state.filteredCards.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isError) {
            return const Center(child: Text("Error fetching cards"));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(child: CardGrid(scrollController: _scrollController, filteredCards: state.filteredCards)),
                if (state.isLoading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
