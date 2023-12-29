import 'package:day22/pages/index.dart';
import 'package:day22/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends ConsumerStatefulWidget {
  static const routePath = '/signup';
  static const routeName = 'signup';

  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final TextEditingController _mobileNumberOrEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
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
              obscureText: true,
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
              onTap: _createAccount,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade400,
                  borderRadius: BorderRadius.circular(6),
                ),
                width: double.infinity,
                height: 48,
                alignment: Alignment.center,
                child: Text(
                  'Create new account',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pushNamed(LoginPage.routeName);
              },
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
                child: Text('Login',
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

  void _createAccount() async {
    try {
      final userCredential =
          await ref.read(authenticationRepositoryProvider).createAccount(
                _mobileNumberOrEmailController.text,
                _passwordController.text,
              );
      context.goNamed(BottomNavigationPage.routeName);
    } catch (e) {
      print("Error: $e");
    }
  }
}
