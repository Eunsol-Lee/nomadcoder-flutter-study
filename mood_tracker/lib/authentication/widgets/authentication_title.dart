import 'package:flutter/material.dart';
import 'package:mood_tracker/gen/assets.gen.dart';

class AuthenticationTitle extends StatelessWidget {
  const AuthenticationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Assets.images.fire.image(),
      Text('MOOD', style: Theme.of(context).textTheme.headlineMedium),
      Assets.images.fire.image(),
    ]);
  }
}
