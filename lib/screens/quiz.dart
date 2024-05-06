import 'package:flutter/material.dart';
import 'package:nour_app/models/questions.dart';
import 'package:nour_app/utils/localization_utils.dart';
import 'package:nour_app/widgets/localization_icon.dart';
import 'package:nour_app/generated/l10n.dart';

List<String> defaultOptions = [
  "not At All",
  "A little bit",
  "moderately",
  "Quite a bit",
  "extremely"
];

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  late List<List<int>> _selectedLevelsList;
  List<Question> _questions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeQuestions();
  }

  void _initializeQuestions() {
    _questions = [
      Question(S.of(context).question1, defaultOptions),
      Question(S.of(context).question2, defaultOptions),
      Question(S.of(context).question3, defaultOptions),
      Question(S.of(context).question4, defaultOptions),
      Question(S.of(context).question5, defaultOptions),
      Question(S.of(context).question6, defaultOptions),
      Question(S.of(context).question7, defaultOptions),
      Question(S.of(context).question8, defaultOptions),
      Question(S.of(context).question9, defaultOptions),
      Question(S.of(context).question10, defaultOptions),
      Question(S.of(context).question11, defaultOptions),
      Question(S.of(context).question12, defaultOptions),
      Question(S.of(context).question13, defaultOptions),
      Question(S.of(context).question14, defaultOptions),
      Question(S.of(context).question15, defaultOptions),
      Question(S.of(context).question16, defaultOptions),
      Question(S.of(context).question17, defaultOptions),
      Question(S.of(context).question18, defaultOptions),
      Question(S.of(context).question19, defaultOptions),
      Question(S.of(context).question20, defaultOptions),
    ];
  }

  @override
  void initState() {
    super.initState();
    _selectedLevelsList = List.generate(
      20,
      (index) => List<int>.filled(5, -1),
    );
  }

  void _nextQuestion() {
    setState(() {
      int increment = 3;
      _currentQuestionIndex =
          (_currentQuestionIndex + increment < _questions.length)
              ? _currentQuestionIndex + increment
              : _currentQuestionIndex;
    });
  }

  void _previousQuestion() {
    setState(() {
      int decrement = 3;
      _currentQuestionIndex = (_currentQuestionIndex >= decrement)
          ? _currentQuestionIndex - decrement
          : 0;
    });
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
                            String option = getLocalizedText(context, key);

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
                                      style: const TextStyle(fontSize: 10)),
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
                      fixedSize: const Size(130, 55),
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
                      fixedSize: const Size(130, 55),
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
