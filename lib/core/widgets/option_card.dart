import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final int index;

  const OptionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      // Waterfall effect for 3 items
      duration: Duration(milliseconds: 800 + (index * 200)),
      curve: Curves.easeInOutCirc,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, 40 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          // BLACK & NAVY GRADIENT
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0F0F0F),
              Color(0xFF1E3A5F)
            ], // Pure Black to your Primary Navy
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
          // THIN GOLD BORDER
          border: Border.all(
            color: const Color(0xFFD4AF37).withOpacity(0.4), // Muted Gold
            width: 0.8,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(18),
            splashColor: const Color(0xFFD4AF37).withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Row(
                children: [
                  // GOLDEN ICON CONTAINER
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: const Color(0xFFD4AF37), width: 1),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFD4AF37).withOpacity(0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: 26,
                      color: const Color(0xFFD4AF37), // Pure Gold Icon
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  // GOLDEN CHEVRON
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Color(0xFFD4AF37),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
