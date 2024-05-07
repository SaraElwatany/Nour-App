import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';
import 'package:nour_app/screens/hopeful_and_calm.dart';
import 'package:nour_app/screens/quiz.dart';
import 'package:nour_app/widgets/localization_icon.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  const ScoreScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 216,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).score(score.toString()),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 250,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).result1,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              S.of(context).result2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Quiz()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fixedSize: const Size(220, 55),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                      ),
                      child: Text(
                        S.of(context).retake,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 251, 251),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HopefulAndCalm()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fixedSize: const Size(128, 55),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                      ),
                      child: Text(
                        S.of(context).back,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 251, 251),
                        ),
                      ),
                    ),
                  ]),
            )));
  }
}
