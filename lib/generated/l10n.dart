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

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Audio`
  String get audio {
    return Intl.message(
      'Audio',
      name: 'audio',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `New account`
  String get new_account {
    return Intl.message(
      'New account',
      name: 'new_account',
      desc: '',
      args: [],
    );
  }

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

  /// `Repeated, disturbing, and unwanted memories of the stressful experience?`
  String get question1 {
    return Intl.message(
      'Repeated, disturbing, and unwanted memories of the stressful experience?',
      name: 'question1',
      desc: '',
      args: [],
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
