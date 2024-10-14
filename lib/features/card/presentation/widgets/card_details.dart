
import 'package:flutter/material.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';

class CardDetailsContainer extends StatelessWidget {
  final CardResponseEntity card;

  const CardDetailsContainer({required this.card});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[50],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            _buildListTile('Name', card.name ?? ""),
            _buildDivider(),
            _buildListTile('Supertype', card.supertype ?? "Unknown"),
            _buildDivider(),
            _buildListTile('HP', card.hp.toString()),
            _buildDivider(),
            _buildListTile('Attacks', _getFirstAttackName()),
            _buildDivider(),
            _buildListTile('Weakness', _getFirstWeaknessType()),
          ],
        ),
      ),
    );
  }

  String _getFirstAttackName() {
    return (card.attacks != null && card.attacks!.isNotEmpty)
        ? card.attacks!.first.name ?? ""
        : 'None';
  }

  String _getFirstWeaknessType() {
    return (card.weaknesses != null && card.weaknesses!.isNotEmpty)
        ? card.weaknesses!.first.type ?? ""
        : 'None';
  }

  Widget _buildListTile(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: Text(value, style: const TextStyle(fontSize: 16)),
        subtitle: Text(title, style: const TextStyle(fontSize: 12)),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey[300],
      thickness: 1,
    );
  }
}
