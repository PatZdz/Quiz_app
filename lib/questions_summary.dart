import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    TextStyle questionStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    TextStyle userAnswerStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(140, 255, 255, 255),
    );
    TextStyle correctAnswerStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              bool isCorrect = data['user_answer'] == data['correct_answer'];
              Color circleColor = isCorrect ? Colors.green : Colors.red;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: circleColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        ((data['question_index'] as int? ?? 0) + 1).toString()),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String? ??
                              'No question available',
                          style: questionStyle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data['user_answer'] as String? ??
                              'No answer provided',
                          style: userAnswerStyle,
                        ),
                        
                        Text(
                          data['correct_answer'] as String? ??
                              'No correct answer available',
                          style: correctAnswerStyle,
                        ),
                        const SizedBox(height: 16), 
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
