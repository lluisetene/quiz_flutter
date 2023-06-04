import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(answer) {
    widget.onSelectedAnswer(answer);

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 194, 133, 223),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    });
              }),
            ],
          ),
        ));
  }
}
