import 'package:animation/number_one_lower_page.dart';
import 'package:animation/number_one_original_page.dart';
import 'package:animation/number_three_page.dart';
import 'package:animation/number_two_page.dart';
import 'package:animation/number_zero_page.dart';
import 'package:flutter/material.dart';

class AnimationAppPage extends StatefulWidget {
  const AnimationAppPage({super.key});

  @override
  State<AnimationAppPage> createState() => _AnimationAppPageState();
}

class _AnimationAppPageState extends State<AnimationAppPage> {
  final PageController _horizontalPageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  final PageController _verticalPageController = PageController(
    initialPage: 1,
  );

  int _currentHorizontalPage = 1;
  int _currentVerticalPage = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Opacity(
            key: ValueKey(_currentHorizontalPage * 10 + _currentVerticalPage),
            opacity: _currentVerticalPage == 1 ? 0.3 : 0.7,
            child: _buildOriginalPage(_currentHorizontalPage),
          ),
        ),
        PageView.builder(
          onPageChanged: (value) => setState(() => _currentVerticalPage = value),
          controller: _verticalPageController,
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, verticalIndex) {
            return PageView.builder(
              onPageChanged: (value) => setState(() => _currentHorizontalPage = value),
              controller: _horizontalPageController,
              itemCount: 4,
              itemBuilder: (context, horizontalIndex) {
                return _pageBuilder(horizontalIndex, verticalIndex);
              },
            );
          },
        ),
      ],
    );
  }

  // Widget _buildPageView(pageIndex) {
  //   switch (pageIndex) {
  //     case 0:
  //       return NumberOneUpperPage();
  //     case 1:
  //       return NumberOnePage();
  //     case 2:
  //       return NumberOneLowerPage();
  //     default:
  //       return NumberOneLowerPage();
  //   }
  // }

  Widget _pageBuilder(horizontalIndex, verticalIndex) {
    switch (verticalIndex) {
      case 0:
        return SizedBox();
      case 1:
        return _roundedContainer(child: _buildOriginalPage(horizontalIndex));

      case 2:
        return SizedBox();

      default:
        return _roundedContainer(
          child: NumberOneLowerPage(),
        );
    }
  }

  Widget _buildOriginalPage(pageIndex) {
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
        return NumberOneOriginalPage();
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
