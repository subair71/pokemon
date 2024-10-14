
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';
import 'package:sample/features/card/presentation/widgets/card_details.dart';

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