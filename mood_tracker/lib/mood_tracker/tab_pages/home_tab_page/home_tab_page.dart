import 'package:flutter/widgets.dart';

class HomeTabPage extends StatelessWidget {
  static const routeName = 'homeTab';
  static const routePath = '/home';
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Tab Page'),
    );
  }
}
