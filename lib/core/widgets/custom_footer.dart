// custom_footer.dart
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
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIcon('assets/icons/icon-navigator.png', 0),
          _buildIcon('assets/icons/icon-buy.png', 1),
          _buildIcon('assets/icons/icon-home.png', 2, isCentralIcon: true),
          _buildIcon('assets/icons/icon-favorite.png', 3),
          _buildIcon('assets/icons/icon-person.png', 4),
        ],
      ),
    );
  }

  Widget _buildIcon(String assetPath, int index, {bool isCentralIcon = false}) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        padding: EdgeInsets.all(isSelected ? 6 : 8),
        transform: isSelected
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE9E9E9) : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.5),
                    blurRadius: 15,
                    offset: Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Image.asset(
          assetPath,
          width: isSelected ? 42 : 28,
          height: isSelected ? 42 : 28,
          color: isSelected ? Colors.orange : Colors.black,
        ),
      ),
    );
  }
}
