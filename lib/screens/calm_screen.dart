import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';
import 'package:nour_app/widgets/button_widget.dart';
import 'package:nour_app/widgets/localization_icon.dart';
import 'package:nour_app/widgets/custom_circle.dart'; // Assuming your custom circle widget is named CustomCircle

class CalmScreen extends StatefulWidget {
  const CalmScreen({Key? key}) : super(key: key);

  @override
  State<CalmScreen> createState() => _CalmScreenState();
}

class _CalmScreenState extends State<CalmScreen> {
  static const maxMinutes = 10;
  static const maxSeconds = maxMinutes * 60;
  int minutes = maxMinutes;
  int seconds = maxSeconds;
  Timer? timer;
  bool timerStarted = false;
  DateTime? startTime;
  int? initialSeconds;

  void startTimer({int initialMinutes = maxMinutes, bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    startTime ??= DateTime.now();
    initialSeconds ??= initialMinutes * 60; 
    timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      final now = DateTime.now();
      final difference = now.difference(startTime!);
      final elapsedTimeInSeconds = difference.inSeconds;
      setState(() {
        final remainingSeconds = initialSeconds! - elapsedTimeInSeconds;
        if (remainingSeconds >= 0) {
          minutes = remainingSeconds ~/ 60;
          seconds = remainingSeconds % 60;
        } else {
          stopTimer(reset: false);
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      startTime = null;
      initialSeconds = null;
      minutes = maxMinutes;
      seconds = maxSeconds;
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  void pauseTimer() {
    setState(() {
      timer?.cancel();
      startTime = null;
      initialSeconds = minutes * 60 + seconds; 
    });
  }

Widget buildButton() {
  final isRunning = timer == null ? false : timer!.isActive;
  final isCompleted = seconds == maxSeconds || seconds == 0;

  if (!timerStarted) {
    return ButtonWidget(
      text: S.of(context).starttimer,
      onClicked: () {
        startTimer(initialMinutes: minutes); 
        setState(() {
          timerStarted = true;
        });
      },
    );
  } else {
    if (isRunning || !isCompleted) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
            text: isRunning ? S.of(context).pause : S.of(context).resume,
            onClicked: () {
              if (isRunning) {
                pauseTimer();
              } else {
                startTimer(reset: false);
              }
            },
          ),
          const SizedBox(width: 20,),
          ButtonWidget(
            text: S.of(context).cancel,
            onClicked: () {
              stopTimer();
              setState(() {
                timerStarted = false;
              });
            },
          ),
        ],
      );
    } else {
      // When timer ends, show only the "Start Timer" button
      return ButtonWidget(
        text: S.of(context).starttimer,
        onClicked: () {
          startTimer(initialMinutes: maxMinutes, reset: true); // Reset timer to original value
          setState(() {
            timerStarted = true;
          });
        },
      );
    }
  }
}


  Widget buildTime() {
    final isDefaultTime = minutes == maxMinutes && seconds == maxSeconds;

    if (!isDefaultTime) {
      if (minutes == 0 && seconds == 0) {
        return const Icon(Icons.done, color: Colors.greenAccent, size: 70);
      } else {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.transparent,
                  content: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                         Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         Padding(
                          padding: const  EdgeInsets.all(20.0),
                          child: Text(
                            S.of(context).entertime,
                            style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              final enteredMinutes = int.tryParse(value) ?? 0;
                              if (enteredMinutes > 0) {
                                minutes = enteredMinutes;
                                seconds = enteredMinutes * 60; 
                              }
                            });
                          },
                          decoration: InputDecoration(
                            hintText: S.of(context).mins,
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            S.of(context).ok,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            '$minutes:${(seconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } else {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.transparent,
                content: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Padding(
                        padding: const  EdgeInsets.all(20.0),
                        child: Text(
                          S.of(context).entertime,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            final enteredMinutes = int.tryParse(value) ?? 0;
                            if (enteredMinutes > 0) {
                              minutes = enteredMinutes;
                              seconds = enteredMinutes * 60; 
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).mins,
                          hintStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          S.of(context).ok,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Text(
          '$maxMinutes:${(maxSeconds % 60).toString().padLeft(2, '0')}',
          style: const TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    S.of(context).calmilte,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  SizedBox(
                    height: 200, 
                    child: PulsatingCircle(), 
                  ),
                  const SizedBox(height: 90,),
                  buildTime(),
                  const SizedBox(height: 50,),
                  buildButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
