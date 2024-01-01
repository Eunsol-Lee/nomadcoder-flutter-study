import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/authentication/index.dart';
import 'package:mood_tracker/shared/index.dart';

class SignupPage extends HookWidget {
  SignupPage({super.key});

  static const routeName = 'authenticationSignup';
  static const routePath = 'signup';

  final emailController = useTextEditingController();
  final passwordController = useTextEditingController();
  final confirmPasswordController = useTextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v48,
              Text('Mood Tracker', style: Theme.of(context).textTheme.headlineLarge),
              Gaps.v24,
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              Gaps.v12,
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              Gaps.v12,
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Enter your password',
                ),
              ),
              Gaps.v12,
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () => _signup(context),
                  child: Text('Signup', style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
              Gaps.v12,
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => _login(context),
                  child: Text('-> login', style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup(BuildContext context) {
    context.goNamed(SignupPage.routeName);
  }

  void _login(BuildContext context) {
    context.goNamed(LoginPage.routeName);
  }
}
