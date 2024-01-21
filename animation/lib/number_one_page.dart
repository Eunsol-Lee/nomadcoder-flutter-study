import 'package:animation/number_one_original_page.dart';
import 'package:animation/number_three_page.dart';
import 'package:animation/number_two_page.dart';
import 'package:animation/number_zero_page.dart';
import 'package:flutter/material.dart';

class NumberOnePage extends StatefulWidget {
  const NumberOnePage({super.key});

  @override
  State<NumberOnePage> createState() => _NumberOnePageState();
}

class _NumberOnePageState extends State<NumberOnePage> {
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Opacity(
                key: ValueKey(_currentPage),
                opacity: 0.3,
                child: _buildPageView(_currentPage))),
        PageView.builder(
          onPageChanged: (value) => setState(() => _currentPage = value),
          controller: _pageController,
          itemCount: 4,
          itemBuilder: (context, index) {
            return _roundedContainer(child: _buildPageView(index));
          },
        ),
      ],
    );
  }

  Widget _buildPageView(pageIndex) {
    switch (pageIndex) {
      case 0:
        return NumberZeroPage();
      case 1:
        return NumberOneOriginalPage();
      case 2:
        return NumberTwoPage();
      case 3:
        return NumberThreePage();
      default:
        return NumberOnePage();
    }
  }

  _roundedContainer({required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
