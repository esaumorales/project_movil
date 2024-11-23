import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomFooter({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 64,
      decoration: const BoxDecoration(
        color: Color(0xFF010B1A),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFBB0C),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIcon('assets/icons/icon-home.png', 0, isCentralIcon: true),
          _buildIcon('assets/icons/icon-favorite.png', 1),
          _buildIcon('assets/icons/icon-person.png', 2),
        ],
      ),
    );
  }

  Widget _buildIcon(String assetPath, int index, {bool isCentralIcon = false}) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        padding: EdgeInsets.all(isSelected ? 6 : 8),
        transform: isSelected
            ? Matrix4.translationValues(0, -32, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF010B1A) : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.orangeAccent.withOpacity(0.9),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: Image.asset(
          assetPath,
          width: isSelected ? 52 : 58,
          height: isSelected ? 52 : 58,
          color: isSelected ? Colors.orange : Colors.white,
        ),
      ),
    );
  }
}
