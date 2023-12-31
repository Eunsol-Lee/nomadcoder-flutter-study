import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:mood_tracker/shared/index.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = 'authenticationLogin';
  static const routePath = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.v48,
            Text('Mood Tracker', style: Theme.of(context).textTheme.headlineLarge),
            Gaps.v24,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            Gaps.v12,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            Gaps.v12,
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonal(
                onPressed: () => _login(context),
                child: Text('Login', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            Gaps.v12,
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Signup', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    context.goNamed(HomeTabPage.routeName);
  }
}
