import 'package:flutter/material.dart';
import 'package:mood_tracker/shared/index.dart';

class ToggleButton extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final VoidCallback onPressed;

  const ToggleButton({super.key, required this.child, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Sizes.size48,
        width: Sizes.size48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffffa6f7) : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size8,
          ),
          border: const Border(
            top: BorderSide(width: Sizes.size1, color: Colors.black),
            left: BorderSide(width: Sizes.size1, color: Colors.black),
            bottom: BorderSide(width: Sizes.size3, color: Colors.black),
            right: BorderSide(width: Sizes.size1, color: Colors.black),
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
