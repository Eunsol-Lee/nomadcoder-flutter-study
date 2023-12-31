import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/mood_tracker/index.dart';

class MtBottomNavigationBarPage extends HookWidget {
  const MtBottomNavigationBarPage({Key? key, required this.child}) : super(key: key);

  static const routeName = 'mtBottomNavigationBar';
  static const routePath = 'mtBottomNavigationBar';

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    return Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.value,
          onTap: (index) {
            currentIndex.value = index;
            if (index == 0) {
              context.goNamed(HomeTabPage.routeName);
            } else if (index == 1) {
              context.goNamed(SettingsTabPage.routeName);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ));
  }
}
