import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/di/injectable.dart';
import 'package:sample/features/card/data/models/card_model.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';
import 'package:sample/features/card/presentation/bloc/remote/card/card_bloc.dart';
import 'package:sample/features/card/presentation/widgets/card_details.dart';
import 'package:sample/features/card/presentation/view/card_list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => sl<CardBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon Cards',
        routerConfig: _router,
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CardListPage(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final card = state.extra as CardResponseEntity;
          return CardDetailPage(card: card);
        },
      ),
    ],
  );
}

class CardDetailPage extends StatelessWidget {
  final CardResponseEntity card;

  const CardDetailPage({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name ?? ""),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                card.images?.large ?? "",
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            CardDetailsContainer(card: card),
          ],
        ),
      ),
    );
  }
}
