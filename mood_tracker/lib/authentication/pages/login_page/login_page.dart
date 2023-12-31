import 'package:flutter/material.dart';
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
            Text('Mood Tracker',
                style: Theme.of(context).textTheme.headlineLarge),
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/authentication/register');
              },
              child:
                  Text('Login', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
