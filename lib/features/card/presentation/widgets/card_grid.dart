
import 'package:flutter/material.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';
import 'package:sample/features/card/presentation/widgets/card_item.dart';

class CardGrid extends StatelessWidget {
  final ScrollController scrollController;
  final List<CardResponseEntity> filteredCards;

  const CardGrid({super.key, required this.scrollController, required this.filteredCards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: filteredCards.length,
      itemBuilder: (context, index) {
        final card = filteredCards[index];
        return CardItem(card: card);
      },
    );
  }
}