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

  /// `All calculations has finished, you can send your results to server`
  String get allCalculationHasFinished {
    return Intl.message(
      'All calculations has finished, you can send your results to server',
      name: 'allCalculationHasFinished',
      desc: '',
      args: [],
    );
  }

  /// `Home page`
  String get homePage {
    return Intl.message(
      'Home page',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `Home screen`
  String get homeScreen {
    return Intl.message(
      'Home screen',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `Preview screen`
  String get previewScreen {
    return Intl.message(
      'Preview screen',
      name: 'previewScreen',
      desc: '',
      args: [],
    );
  }

  /// `Process screen`
  String get processScreen {
    return Intl.message(
      'Process screen',
      name: 'processScreen',
      desc: '',
      args: [],
    );
  }

  /// `Result list screen`
  String get resultListScreen {
    return Intl.message(
      'Result list screen',
      name: 'resultListScreen',
      desc: '',
      args: [],
    );
  }

  /// `Send results to server`
  String get sendResultToServer {
    return Intl.message(
      'Send results to server',
      name: 'sendResultToServer',
      desc: '',
      args: [],
    );
  }

  /// `Set valid API base URL in order to continue`
  String get setValidApi {
    return Intl.message(
      'Set valid API base URL in order to continue',
      name: 'setValidApi',
      desc: '',
      args: [],
    );
  }

  /// `Start counting process`
  String get startCountingProcess {
    return Intl.message(
      'Start counting process',
      name: 'startCountingProcess',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test {
    return Intl.message(
      'Test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknownError {
    return Intl.message(
      'Unknown error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Wrong decision`
  String get wrongDecision {
    return Intl.message(
      'Wrong decision',
      name: 'wrongDecision',
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
