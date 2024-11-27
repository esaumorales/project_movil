import 'package:flutter/material.dart';

class AnimatedLoadingCard extends StatefulWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  const AnimatedLoadingCard({
    Key? key,
    this.height = 150,
    this.width = double.infinity,
    this.borderRadius,
  }) : super(key: key);

  @override
  _AnimatedLoadingCardState createState() => _AnimatedLoadingCardState();
}

class _AnimatedLoadingCardState extends State<AnimatedLoadingCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = _controller.drive(
      ColorTween(
        begin: Colors.grey.shade300,
        end: Colors.grey.shade100,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: _animation.value,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
          ),
        );
      },
    );
  }
}
