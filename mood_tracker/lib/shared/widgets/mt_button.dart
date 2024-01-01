import 'package:flutter/material.dart';
import 'package:mood_tracker/shared/index.dart';

class MtButton extends StatelessWidget {
  const MtButton(this.text, {super.key, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size6),
        decoration: BoxDecoration(
          color: const Color(0xffffa6f7),
          borderRadius: BorderRadius.circular(
            Sizes.size32,
          ),
          border: const Border(
            top: BorderSide(width: Sizes.size3, color: Colors.black),
            right: BorderSide(width: Sizes.size5, color: Colors.black),
            bottom: BorderSide(width: Sizes.size5, color: Colors.black),
            left: BorderSide(width: Sizes.size3, color: Colors.black),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
