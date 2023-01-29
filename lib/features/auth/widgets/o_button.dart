import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';

class OButton extends StatelessWidget {
  const OButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 52,
        width: size.width,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
