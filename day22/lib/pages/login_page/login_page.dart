import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileNumberOrEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              'English (US)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.threads,
                size: 80,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 80),
            TextFormField(
              controller: _mobileNumberOrEmailController,
              decoration: InputDecoration(
                hintText: 'Mobile number or email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade400,
                  borderRadius: BorderRadius.circular(6),
                ),
                width: double.infinity,
                height: 48,
                alignment: Alignment.center,
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 48,
                alignment: Alignment.center,
                child: Text('Forgot password?',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                width: double.infinity,
                height: 48,
                alignment: Alignment.center,
                child: Text('Create new account',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 48,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.meta,
                    color: Theme.of(context).shadowColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Meta',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
