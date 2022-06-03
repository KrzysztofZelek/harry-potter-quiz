import 'package:flutter/material.dart';
import 'package:quiz_app/answer/answer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _questionIndex = 0;
  int _answerScore = 0;
  bool answerSelected = false;
  bool endOfQuiz = false;

  void selectedAnswer(bool isCorrect) {
    setState(() {
      answerSelected = true;
      if (isCorrect) {
        _answerScore++;
      }

      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      _questionIndex++;
      answerSelected = false;
      if (_questionIndex >= _questions.length) {
        return resetQuiz();
      }
    });
  }

  void resetQuiz() {
    setState(() {
      answerSelected = false;
      _questionIndex = 0;
      _answerScore = 0;
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: const Text('Harry Potter Quiz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.black, Colors.green]),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'].toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Column(
              children: [
                ...(_questions[_questionIndex]['answer']
                        as List<Map<String, dynamic>>)
                    .map(
                  (answer) => Answer(
                    answer: answer['answerText'].toString(),
                    answerColor: answerSelected
                        ? answer['score']
                            ? Colors.green
                            : Colors.red
                        : Colors.transparent,
                    onTap: () {
                      if (answerSelected) {
                        return;
                      }
                      selectedAnswer(answer['score']);
                    },
                  ),
                ),
                Text(
                  'Result: $_answerScore/${_questions.length}',
                  style: const TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 80),
                      primary: Colors.teal[900],
                      textStyle: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      )),
                  onPressed: () {
                    if (!answerSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Please select the answer before moving to the next question.'),
                      ));
                      return;
                    }
                    nextQuestion();
                  },
                  child: Text(
                    endOfQuiz ? 'ResetQuiz' : 'Next Question',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  final _questions = const [
    {
      'question': 'Who\'s the main villain in the Harry Potter saga?',
      'answer': [
        {'answerText': 'Draco Malfoy', 'score': false},
        {'answerText': 'Voldemort', 'score': true},
        {'answerText': 'Severus Snape', 'score': false},
        {'answerText': 'Dolores Umbridge', 'score': false},
      ]
    },
    {
      'question': 'Who\'s the wife of Harry Potter?',
      'answer': [
        {'answerText': 'Hermione', 'score': false},
        {'answerText': 'Blair', 'score': false},
        {'answerText': 'Cho', 'score': false},
        {'answerText': 'Ginnie', 'score': true},
      ]
    },
    {
      'question':
          'What\'s the first flying broom Harry used in the Quidditch match?',
      'answer': [
        {'answerText': 'Nimbus 2001', 'score': false},
        {'answerText': 'Comet 300', 'score': false},
        {'answerText': 'Nimbus 2000', 'score': true},
        {'answerText': 'Firebolt', 'score': false},
      ]
    },
    {
      'question':
          'What\'s the name of the Giant Snake hidden in the Chamber of Secrets?',
      'answer': [
        {'answerText': 'Cobra', 'score': false},
        {'answerText': 'Viper', 'score': false},
        {'answerText': 'Basilisk', 'score': true},
        {'answerText': 'Serpent', 'score': false},
      ]
    },
    {
      'question': 'What\'s the name of Harry Potter\'s father?',
      'answer': [
        {'answerText': 'John', 'score': false},
        {'answerText': 'Julius', 'score': false},
        {'answerText': 'Jeremy', 'score': false},
        {'answerText': 'James', 'score': true},
      ]
    },
    {
      'question': 'What\'s the name of Higrid\'s Hippogriff?',
      'answer': [
        {'answerText': 'Felix', 'score': false},
        {'answerText': 'Buckbeak', 'score': true},
        {'answerText': 'Fang', 'score': false},
        {'answerText': 'Scabbers', 'score': false},
      ]
    },
    {
      'question': 'What\'s the Ron\'s rat name?',
      'answer': [
        {'answerText': 'Percy', 'score': false},
        {'answerText': 'Fred', 'score': false},
        {'answerText': 'George', 'score': false},
        {'answerText': 'Scabbers', 'score': true},
      ]
    },
    {
      'question': 'How many Horcruxes did Voldemort create?',
      'answer': [
        {'answerText': '9', 'score': false},
        {'answerText': '8', 'score': true},
        {'answerText': '7', 'score': false},
        {'answerText': '6', 'score': false},
      ]
    },
  ];
}
