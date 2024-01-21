import 'package:day65/flash_card.dart';
import 'package:flutter/material.dart';

import 'flash_card_model.dart';
import 'progress_bar_painter.dart';

class FlashcardList extends StatefulWidget {
  @override
  _FlashcardListState createState() => _FlashcardListState();
}

class _FlashcardListState extends State<FlashcardList> {
  List<FlashcardModel> flashcards = [
    FlashcardModel(question: "Question 1", answer: "Answer 1"),
    FlashcardModel(question: "Question 2", answer: "Answer 2"),
    // Add more flashcards
  ];
  int currentIndex = 0;
  double progress = 0;
  Color backgroundColor = Colors.blue.shade200;

  void nextCard() {
    if (currentIndex < flashcards.length - 1) {
      setState(() {
        currentIndex++;
        progress = (currentIndex + 1) / flashcards.length;
      });
    }
  }

  void onCardSwiped(Direction direction) {
    setState(() {
      backgroundColor = direction == Direction.left ? Colors.red : Colors.green;
    });
    nextCard();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent, // Scaffold의 배경색을 투명하게 설정
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              // Swipe to the left
              onCardSwiped(Direction.left);
            } else if (details.primaryVelocity! > 0) {
              // Swipe to the right
              onCardSwiped(Direction.right);
            }
          },
          child: Center(
            child: Flashcard(flashcard: flashcards[currentIndex]),
          ),
        ),
        bottomNavigationBar: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 20),
          painter: ProgressBarPainter(progress: progress),
        ),
      ),
    );
  }
}

enum Direction { left, right }
