import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  final double size;
  const CustomLoader({super.key, this.size = 80.0});

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.8, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFD4AF37), width: 2.5),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD4AF37).withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            Icons.gavel_rounded,
            size: widget.size * 0.5,
            color: const Color(0xFFD4AF37),
          ),
        ),
      ),
    );
  }
}
