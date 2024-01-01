import 'package:flutter/material.dart';
import 'package:mood_tracker/shared/index.dart';

class AuthenticationTitle extends StatelessWidget {
  const AuthenticationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Assets.images.fire.image(),
          Gaps.h6,
          Text('MOOD', style: Theme.of(context).textTheme.titleLarge),
          Gaps.h6,
          Assets.images.fire.image(),
        ],
      ),
    );
  }
}
