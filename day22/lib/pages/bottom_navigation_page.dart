import 'package:go_router/go_router.dart';

import 'activity_tab/activity_tab.dart';

import 'home_tab/home_tab.dart';
import 'package:flutter/material.dart';

import 'profile_and_settings_tab/index.dart';
import 'search_tab/search_tab.dart';
import 'widgets/index.dart';

class BottomNavigationPage extends StatefulWidget {
  static const routePath = '/';
  static const routeName = 'home';

  final int? index;
  const BottomNavigationPage({super.key, this.index});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sclaeAnimation;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.index ?? 0;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _sclaeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(_animationController);
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sclaeAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _sclaeAnimation.value,
          child: Scaffold(
            backgroundColor: Theme.of(context).shadowColor,
            body: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(
                        16)), // This line makes the borders rounded
              ),
              child: _getPage(_selectedIndex),
            ),
            bottomNavigationBar: ThreadBottomNavigationBar(
              selectedIndex: _selectedIndex,
              onItemTapped: (index) =>
                  _onItemTapped(index: index, context: context),
            ),
          ),
        );
      },
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
      case 2:
        return const HomeTab();
      case 1:
        return const SearchTab();
      case 3:
        return const ActivityTab();
      case 4:
        return const ProfileAndSettingsTab();
      default:
        return const ProfileAndSettingsTab();
    }
  }

  void _onItemTapped({required int index, required BuildContext context}) {
    setState(
      () {
        _selectedIndex = index;
      },
    );

    if (index == 2) {
      _showNewThreadBottomSheet(context);
    }

    switch (index) {
      case 0:
        context.go('/');
      case 1:
        context.go('/search');
      case 3:
        context.go('/activity');
      case 4:
        context.go('/settings');

      default:
        context.go('/');
    }
  }

  void _showNewThreadBottomSheet(BuildContext context) async {
    _animationController.forward();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) => const NewThreadBottomSheet(),
    );
    _animationController.reverse();
    setState(() {
      _selectedIndex = 0;
    });
  }
}
