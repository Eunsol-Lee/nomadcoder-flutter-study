import 'package:flutter/widgets.dart';

class SettingsTabPage extends StatelessWidget {
  static const routeName = 'settingsTab';
  static const routePath = '/settings';

  const SettingsTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Tab Page'),
    );
  }
}
