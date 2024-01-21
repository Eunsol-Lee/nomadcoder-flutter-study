import 'package:animation/number_one_lower_page.dart';
import 'package:animation/number_one_page.dart';
import 'package:animation/number_one_upper_page.dart';
import 'package:flutter/material.dart';

class AnimationAppPage extends StatefulWidget {
  const AnimationAppPage({super.key});

  @override
  State<AnimationAppPage> createState() => _AnimationAppPageState();
}

class _AnimationAppPageState extends State<AnimationAppPage> {
  final PageController _pageController = PageController(
    initialPage: 1,
  );

  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          onPageChanged: (value) => setState(() => _currentPage = value),
          controller: _pageController,
          itemCount: 4,
          itemBuilder: (context, index) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Opacity(
                    key: ValueKey(index),
                    opacity: 1,
                    child: _buildPageView(index)));
          },
        ),
      ],
    );
  }

  Widget _buildPageView(pageIndex) {
    switch (pageIndex) {
      case 0:
        return NumberOneUpperPage();
      case 1:
        return NumberOnePage();
      case 2:
        return NumberOneLowerPage();
      default:
        return NumberOneLowerPage();
    }
  }
}
