import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_tracker/authentication/index.dart';
import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:mood_tracker/shared/index.dart';

import 'login_page_view_model.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  static const routeName = 'authenticationLogin';
  static const routePath = 'login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final attemptedLoginResult = ref.watch(loginPageViewModelProvider);

    if (attemptedLoginResult.status == Status.success) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Success'),
            content: const Text('Successfully logged in'),
            actions: <Widget>[
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref.read(loginPageViewModelProvider.notifier).resetState();
                    context.goNamed(HomeTabPage.routeName);
                  }),
            ],
          ),
        );
      });
    }

    if (attemptedLoginResult.status == Status.error) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Error'),
            content: Text(attemptedLoginResult.errorMessage!),
            actions: <Widget>[
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref.read(loginPageViewModelProvider.notifier).resetState();
                  }),
            ],
          ),
        );
      });
    }
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const MtTitle(),
            centerTitle: true,
            toolbarHeight: Sizes.size96,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                Text('Welcome!', style: Theme.of(context).textTheme.titleLarge),
                Gaps.v36,
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                Gaps.v12,
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                Gaps.v12,
                SizedBox(
                  width: double.infinity,
                  child: MtButton(
                    'Enter',
                    onPressed: () => _login(ref: ref, email: emailController.text, password: passwordController.text),
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size60, vertical: Sizes.size24),
            height: Sizes.size96,
            width: double.infinity,
            child: MtButton(
              'Create an account',
              onPressed: () => _goToSignupPage(context),
            ),
          ),
        ),
        if (attemptedLoginResult.status != Status.initial)
          const ModalBarrier(dismissible: false, color: Colors.black45),
      ],
    );
  }

  void _login({required WidgetRef ref, required String email, required String password}) {
    ref.read(loginPageViewModelProvider.notifier).login(email: email, password: password);
  }

  void _goToSignupPage(BuildContext context) {
    context.goNamed(SignupPage.routeName);
  }
}
