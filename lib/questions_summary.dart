import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  final Color correctAnswerColor = const Color.fromARGB(255, 113, 206, 116);
  final Color wrongAnswerColor = const Color.fromARGB(232, 214, 14, 7);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
          child: Column(
        children: summaryData.map((data) {
          return Row(
            children: [
              ClipOval(
                child: Container(
                  alignment: Alignment.topCenter,
                  color: (data['correct_answer'] == data['user_answer'])
                      ? correctAnswerColor
                      : wrongAnswerColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        )
                      ]),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(data['user_answer'] as String,
                        style: const TextStyle(color: Colors.amber)),
                    Text(data['correct_answer'] as String,
                        style: TextStyle(color: correctAnswerColor)),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      )),
    );
  }
}
