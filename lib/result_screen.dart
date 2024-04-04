import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';
import 'question_summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.onRestart});

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_chose_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestion = questions.length;
    final correctQuestion = summaryData.where((data) {
      return data['user_chose_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsetsDirectional.only(top: 60.00),
      child: Column(
        children: [
          Text(
            "You answered $totalQuestion out $correctQuestion question correctly!",
            style: GoogleFonts.lato(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          QuestionSummary(summaryData: getSummaryData()),
          const SizedBox(height: 30),
          TextButton.icon(
            icon: const Icon(Icons.restart_alt,color: Colors.white),
            onPressed: onRestart,
            label: const Text(
              'Restart Quiz!',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
