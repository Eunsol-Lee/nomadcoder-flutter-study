import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:mood_tracker/shared/index.dart';

class MtBottomNavigationBarPage extends HookWidget {
  const MtBottomNavigationBarPage({super.key, required this.child});

  static const routeName = 'mtBottomNavigationBar';
  static const routePath = 'mtBottomNavigationBar';

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const MtTitle(),
        centerTitle: true,
        toolbarHeight: Sizes.size96,
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex.value,
        onTap: (index) {
          currentIndex.value = index;
          if (index == 0) {
            context.goNamed(HomeTabPage.routeName);
          } else if (index == 1) {
            context.goNamed(CreateTabPage.routeName);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create_outlined),
            activeIcon: Icon(Icons.create),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
