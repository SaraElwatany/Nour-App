import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';
import 'package:nour_app/widgets/localization_icon.dart';

List<String> defaultOptions = [
  "not At All",
  "A little bit",
  "moderately",
  "Quite a bit",
  "extremely"
];

class Question {
  final String questionText;
  final List<String> optionsKeys;

  Question(this.questionText, this.optionsKeys);
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  late List<List<int>> _selectedLevelsList;

  final List<Question> _questions = [
    Question(
        "1- Repeated, disturbing, and unwanted memories of the stressful experience?",
        defaultOptions),
    Question("Repeated, disturbing dreams of the stressful experience?",
        defaultOptions),
    Question(
        "2- Suddenly feeling or acting as if the stressful experience were actually happening again (as if you were actually back there reliving it)?",
        defaultOptions),
    Question(
        "3- Feeling very upset when something reminded you of the stressful experience?",
        defaultOptions),
    Question("Question 5", defaultOptions),
    Question("Question 6", defaultOptions),
    Question("Question 7", defaultOptions),
  ];

  @override
  void initState() {
    super.initState();
    _selectedLevelsList = List.generate(
      _questions.length,
      (index) => List<int>.filled(_questions[index].optionsKeys.length, -1),
    );
  }

  void _nextQuestion() {
    setState(() {
      int increment = 3;
      if (_currentQuestionIndex + increment < _questions.length) {
        _currentQuestionIndex += increment;
      } else {
        _currentQuestionIndex =
            _questions.length - (_questions.length % increment);
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      int decrement = 3;
      if (_currentQuestionIndex >= decrement) {
        _currentQuestionIndex -= decrement;
      } else {
        _currentQuestionIndex = 0;
      }
    });
  }

  String _getLocalizedText(BuildContext context, String key) {
    switch (key) {
      case "not At All":
        return S.of(context).notatall;
      case "moderately":
        return S.of(context).moderately;
      case "extremely":
        return S.of(context).extremely;
      case "Quite a bit":
        return S.of(context).quitAbit;
      case "A little bit":
        return S.of(context).aLittleBit;
      default:
        return " "; // Fallback for unrecognized key
    }
  }

  double _calculateProgress() {
    int answeredQuestions = _selectedLevelsList
        .where((options) => options.any((element) => element != -1))
        .length;
    return answeredQuestions / _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = _calculateProgress();

    return Scaffold(
      appBar: const LocalizationIcon(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 274,
                height: 22,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.surface),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Theme.of(context).colorScheme.surface,
                    inactiveTrackColor:
                        Theme.of(context).colorScheme.surface.withOpacity(0.3),
                    trackHeight: 2.0,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    thumbColor: Theme.of(context).colorScheme.surface,
                  ),
                  child: Slider(
                    value: progressValue,
                    min: 0.0,
                    max: 1.0,
                    divisions: _questions.length,
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: _questions
                      .sublist(
                          _currentQuestionIndex,
                          _currentQuestionIndex + 3 < _questions.length
                              ? _currentQuestionIndex + 3
                              : _questions.length)
                      .map((question) {
                    int questionIndex = _questions.indexOf(question);
                    return Column(
                      children: [
                        Text(
                          question.questionText,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(question.optionsKeys.length,
                              (index) {
                            String key = question.optionsKeys[index];
                            String option = _getLocalizedText(context, key);

                            return Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio<int>(
                                    value: index,
                                    groupValue:
                                        _selectedLevelsList[questionIndex]
                                            .indexOf(1),
                                    activeColor:
                                        Theme.of(context).colorScheme.surface,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedLevelsList[questionIndex]
                                            .fillRange(
                                                0,
                                                _selectedLevelsList[
                                                        questionIndex]
                                                    .length,
                                                -1);
                                        _selectedLevelsList[questionIndex]
                                            [index] = 1;
                                      });
                                    },
                                  ),
                                  Text(option,
                                      style: const TextStyle(fontSize: 15)),
                                ],
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _previousQuestion,
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(128, 55),
                    ),
                    child: Text(
                      S.of(context).previous,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(128, 55),
                    ),
                    child: Text(
                      S.of(context).next,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
