// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hope Box`
  String get hope_box {
    return Intl.message(
      'Hope Box',
      name: 'hope_box',
      desc: '',
      args: [],
    );
  }

<<<<<<< HEAD
  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
=======
  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
>>>>>>> e47c731 (Hope Box)
      desc: '',
      args: [],
    );
  }

<<<<<<< HEAD
  /// `New account`
  String get new_account {
    return Intl.message(
      'New account',
      name: 'new_account',
=======
  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
>>>>>>> e47c731 (Hope Box)
      desc: '',
      args: [],
    );
  }

<<<<<<< HEAD
  /// `hopeful `
  String get hope {
    return Intl.message(
      'hopeful ',
      name: 'hope',
      desc: '',
      args: [],
    );
  }

  /// `hopeful`
  String get hopeful {
    return Intl.message(
      'hopeful',
      name: 'hopeful',
      desc: '',
      args: [],
    );
  }

  /// `calm`
  String get calm {
    return Intl.message(
      'calm',
      name: 'calm',
      desc: '',
      args: [],
    );
  }

  /// `follow up`
  String get follow {
    return Intl.message(
      'follow up',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get email_validation {
    return Intl.message(
      'Please enter your email',
      name: 'email_validation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get password_validation {
    return Intl.message(
      'Please enter your password',
      name: 'password_validation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get name_validation {
    return Intl.message(
      'Please enter your name',
      name: 'name_validation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your age`
  String get age_validation {
    return Intl.message(
      'Please enter your age',
      name: 'age_validation',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Not at all`
  String get notatall {
    return Intl.message(
      'Not at all',
      name: 'notatall',
      desc: '',
      args: [],
    );
  }

  /// `Moderately`
  String get moderately {
    return Intl.message(
      'Moderately',
      name: 'moderately',
      desc: '',
      args: [],
    );
  }

  /// `Extremely `
  String get extremely {
    return Intl.message(
      'Extremely ',
      name: 'extremely',
      desc: '',
      args: [],
    );
  }

  /// `A little bit`
  String get aLittleBit {
    return Intl.message(
      'A little bit',
      name: 'aLittleBit',
      desc: '',
      args: [],
    );
  }

  /// `Quite a bit`
  String get quitAbit {
    return Intl.message(
      'Quite a bit',
      name: 'quitAbit',
      desc: '',
      args: [],
    );
  }

  /// `1. Repeated, disturbing, and unwanted memories of the stressful experience?`
  String get question1 {
    return Intl.message(
      '1. Repeated, disturbing, and unwanted memories of the stressful experience?',
      name: 'question1',
=======
  /// `Audio`
  String get audio {
    return Intl.message(
      'Audio',
      name: 'audio',
>>>>>>> e47c731 (Hope Box)
      desc: '',
      args: [],
    );
  }

  /// `2. Repeated, disturbing dreams of the stressful experience?`
  String get question2 {
    return Intl.message(
      '2. Repeated, disturbing dreams of the stressful experience?',
      name: 'question2',
      desc: '',
      args: [],
    );
  }

  /// `3. Suddenly feeling or acting as if the stressful experience were actually happening again (as if you were actually back there reliving it)?`
  String get question3 {
    return Intl.message(
      '3. Suddenly feeling or acting as if the stressful experience were actually happening again (as if you were actually back there reliving it)?',
      name: 'question3',
      desc: '',
      args: [],
    );
  }

  /// `4. Feeling very upset when something reminded you of the stressful experience?`
  String get question4 {
    return Intl.message(
      '4. Feeling very upset when something reminded you of the stressful experience?',
      name: 'question4',
      desc: '',
      args: [],
    );
  }

  /// `5. Having strong physical reactions when something reminded you of the stressful experience (for example, heart pounding, trouble breathing, sweating)?`
  String get question5 {
    return Intl.message(
      '5. Having strong physical reactions when something reminded you of the stressful experience (for example, heart pounding, trouble breathing, sweating)?',
      name: 'question5',
      desc: '',
      args: [],
    );
  }

  /// `6. Avoiding memories, thoughts, or feelings related to the stressful experience?`
  String get question6 {
    return Intl.message(
      '6. Avoiding memories, thoughts, or feelings related to the stressful experience?',
      name: 'question6',
      desc: '',
      args: [],
    );
  }

  /// `7. Avoiding external reminders of the stressful experience (for example, people, places, conversations, activities, objects, or situations)?`
  String get question7 {
    return Intl.message(
      '7. Avoiding external reminders of the stressful experience (for example, people, places, conversations, activities, objects, or situations)?',
      name: 'question7',
      desc: '',
      args: [],
    );
  }

  /// `8. Trouble remembering important parts of the stressful experience?`
  String get question8 {
    return Intl.message(
      '8. Trouble remembering important parts of the stressful experience?',
      name: 'question8',
      desc: '',
      args: [],
    );
  }

  /// `9. Having strong negative beliefs about yourself, other people, or the world (for example, having thoughts such as: I am bad, there is something seriously wrong with me, no one can be trusted, the world is completely dangerous)?`
  String get question9 {
    return Intl.message(
      '9. Having strong negative beliefs about yourself, other people, or the world (for example, having thoughts such as: I am bad, there is something seriously wrong with me, no one can be trusted, the world is completely dangerous)?',
      name: 'question9',
      desc: '',
      args: [],
    );
  }

  /// `10. Blaming yourself or someone else for the stressful experience or what happened after it?`
  String get question10 {
    return Intl.message(
      '10. Blaming yourself or someone else for the stressful experience or what happened after it?',
      name: 'question10',
      desc: '',
      args: [],
    );
  }

  /// `11. Having strong negative feelings such as fear, horror, anger, guilt, or shame?`
  String get question11 {
    return Intl.message(
      '11. Having strong negative feelings such as fear, horror, anger, guilt, or shame?',
      name: 'question11',
      desc: '',
      args: [],
    );
  }

  /// `12. Loss of interest in activities that you used to enjoy?`
  String get question12 {
    return Intl.message(
      '12. Loss of interest in activities that you used to enjoy?',
      name: 'question12',
      desc: '',
      args: [],
    );
  }

  /// `13. Feeling distant or cut off from other people?`
  String get question13 {
    return Intl.message(
      '13. Feeling distant or cut off from other people?',
      name: 'question13',
      desc: '',
      args: [],
    );
  }

  /// `14. Trouble experiencing positive feelings (for example, being unable to feel happiness or have loving feelings for people close to you)?`
  String get question14 {
    return Intl.message(
      '14. Trouble experiencing positive feelings (for example, being unable to feel happiness or have loving feelings for people close to you)?',
      name: 'question14',
      desc: '',
      args: [],
    );
  }

  /// `15. Irritable behavior, angry outbursts, or acting aggressively?`
  String get question15 {
    return Intl.message(
      '15. Irritable behavior, angry outbursts, or acting aggressively?',
      name: 'question15',
      desc: '',
      args: [],
    );
  }

  /// `16. Taking too many risks or doing things that could cause you harm?`
  String get question16 {
    return Intl.message(
      '16. Taking too many risks or doing things that could cause you harm?',
      name: 'question16',
      desc: '',
      args: [],
    );
  }

  /// `17. Being “superalert” or watchful or on guard?`
  String get question17 {
    return Intl.message(
      '17. Being “superalert” or watchful or on guard?',
      name: 'question17',
      desc: '',
      args: [],
    );
  }

  /// `18. Feeling jumpy or easily startled?`
  String get question18 {
    return Intl.message(
      '18. Feeling jumpy or easily startled?',
      name: 'question18',
      desc: '',
      args: [],
    );
  }

  /// `19. Having difficulty concentrating?`
  String get question19 {
    return Intl.message(
      '19. Having difficulty concentrating?',
      name: 'question19',
      desc: '',
      args: [],
    );
  }

  /// `20. Trouble falling or staying asleep?`
  String get question20 {
    return Intl.message(
      '20. Trouble falling or staying asleep?',
      name: 'question20',
      desc: '',
      args: [],
    );
  }

  /// `Trauma Level: {score}`
  String score(Object score) {
    return Intl.message(
      'Trauma Level: $score',
      name: 'score',
      desc: '',
      args: [score],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
