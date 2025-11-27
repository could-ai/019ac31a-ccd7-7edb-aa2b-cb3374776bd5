import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // Mock questions for the psychometric test
  final List<String> _questions = [
    "I enjoy solving complex mathematical problems.",
    "I prefer working in a team rather than alone.",
    "I am interested in how machines and gadgets work.",
    "I like expressing myself through art, music, or writing.",
    "I enjoy helping others with their personal problems.",
    "I like to organize things and keep detailed records.",
    "I am comfortable taking risks to achieve a goal.",
    "I enjoy learning about history and different cultures.",
    "I prefer practical tasks over theoretical discussions.",
    "I am often the one who takes charge in group situations."
  ];

  // Store answers: Question Index -> Score (1-5)
  final Map<int, int> _answers = {};

  void _submitTest() {
    if (_answers.length < _questions.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please answer all ${_questions.length} questions before submitting.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    
    // Proceed to results
    Navigator.pushReplacementNamed(context, '/result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psychometric Assessment'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Rate the following statements from 1 (Strongly Disagree) to 5 (Strongly Agree)',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ${_questions[index]}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Disagree', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            Expanded(
                              child: Slider(
                                value: (_answers[index] ?? 3).toDouble(),
                                min: 1,
                                max: 5,
                                divisions: 4,
                                label: _answers[index]?.toString() ?? 'Neutral',
                                onChanged: (value) {
                                  setState(() {
                                    _answers[index] = value.round();
                                  });
                                },
                              ),
                            ),
                            const Text('Agree', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _submitTest,
        label: const Text('Submit Assessment'),
        icon: const Icon(Icons.check_circle),
      ),
    );
  }
}
