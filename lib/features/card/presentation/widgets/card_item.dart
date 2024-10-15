

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';

class CardItem extends StatelessWidget {
  final CardResponseEntity card;

  const CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/detail', extra: card),
      child: Card(
        color: Colors.lightBlue[50],
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(card.images?.small ?? "", fit: BoxFit.contain),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  card.name ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
