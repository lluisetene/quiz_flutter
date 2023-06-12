import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrectAnswer});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final index = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAnswer
              ? const Color.fromARGB(255, 113, 206, 116)
              : const Color.fromARGB(232, 214, 14, 7),
          borderRadius: BorderRadius.circular(100)),
      child: Text(index.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 22, 2, 56))),
    );
  }
}
