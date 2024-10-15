import 'package:flutter/material.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';

class CardDetailsContainer extends StatefulWidget {
  final CardResponseEntity card;

  const CardDetailsContainer({required this.card});

  @override
  _CardDetailsContainerState createState() => _CardDetailsContainerState();
}

class _CardDetailsContainerState extends State<CardDetailsContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(8.0)),
          ),
          child: Column(
            children: [
              _buildListTile('Name', widget.card.name ?? ""),
              _buildDivider(),
              _buildListTile('Supertype', widget.card.supertype ?? "Unknown"),
              _buildDivider(),
              _buildListTile('HP', widget.card.hp.toString()),
              _buildDivider(),
              _buildListTile('Attacks', _getFirstAttackName()),
              _buildDivider(),
              _buildListTile('Weakness', _getFirstWeaknessType()),
            ],
          ),
        ),
      ),
    );
  }

  String _getFirstAttackName() {
    return (widget.card.attacks != null && widget.card.attacks!.isNotEmpty)
        ? widget.card.attacks!.first.name ?? ""
        : 'None';
  }

  String _getFirstWeaknessType() {
    return (widget.card.weaknesses != null && widget.card.weaknesses!.isNotEmpty)
        ? widget.card.weaknesses!.first.type ?? ""
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
