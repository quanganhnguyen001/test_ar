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

  /// `Use a camera to draw`
  String get intro_title_1 {
    return Intl.message(
      'Use a camera to draw',
      name: 'intro_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Simple calculate all types of credits`
  String get intro_subtitle_1 {
    return Intl.message(
      'Simple calculate all types of credits',
      name: 'intro_subtitle_1',
      desc: '',
      args: [],
    );
  }

  /// `Various free templates`
  String get intro_title_2 {
    return Intl.message(
      'Various free templates',
      name: 'intro_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Lots of tracing templates: Animals, Cars, Nature, Food, Anime etc.`
  String get intro_subtitle_2 {
    return Intl.message(
      'Lots of tracing templates: Animals, Cars, Nature, Food, Anime etc.',
      name: 'intro_subtitle_2',
      desc: '',
      args: [],
    );
  }

  /// `Trace images from photos`
  String get intro_title_3 {
    return Intl.message(
      'Trace images from photos',
      name: 'intro_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Easily convert photos to pencil drawings`
  String get intro_subtitle_3 {
    return Intl.message(
      'Easily convert photos to pencil drawings',
      name: 'intro_subtitle_3',
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

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Permission`
  String get permission {
    return Intl.message(
      'Permission',
      name: 'permission',
      desc: '',
      args: [],
    );
  }

  /// `This app needs permissions below to work properly`
  String get permission_description {
    return Intl.message(
      'This app needs permissions below to work properly',
      name: 'permission_description',
      desc: '',
      args: [],
    );
  }

  /// `Allow access`
  String get allow_access {
    return Intl.message(
      'Allow access',
      name: 'allow_access',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_text {
    return Intl.message(
      'Continue',
      name: 'continue_text',
      desc: '',
      args: [],
    );
  }

  /// `Draw using templates`
  String get home_using_template {
    return Intl.message(
      'Draw using templates',
      name: 'home_using_template',
      desc: '',
      args: [],
    );
  }

  /// `Draw using gallery photos`
  String get home_using_gallery_photos {
    return Intl.message(
      'Draw using gallery photos',
      name: 'home_using_gallery_photos',
      desc: '',
      args: [],
    );
  }

  /// `Templates`
  String get templates {
    return Intl.message(
      'Templates',
      name: 'templates',
      desc: '',
      args: [],
    );
  }

  /// `Write text`
  String get write_text {
    return Intl.message(
      'Write text',
      name: 'write_text',
      desc: '',
      args: [],
    );
  }

  /// `Trending`
  String get trending {
    return Intl.message(
      'Trending',
      name: 'trending',
      desc: '',
      args: [],
    );
  }

  /// `Anime`
  String get anime {
    return Intl.message(
      'Anime',
      name: 'anime',
      desc: '',
      args: [],
    );
  }

  /// `Drawing steps`
  String get drawing_step {
    return Intl.message(
      'Drawing steps',
      name: 'drawing_step',
      desc: '',
      args: [],
    );
  }

  /// `Animals`
  String get animals {
    return Intl.message(
      'Animals',
      name: 'animals',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Draw with camera`
  String get draw_with_camera {
    return Intl.message(
      'Draw with camera',
      name: 'draw_with_camera',
      desc: '',
      args: [],
    );
  }

  /// `Use a tripod, a glass, or a stack of books to \nhold your phone in place while you draw`
  String get instructions_description {
    return Intl.message(
      'Use a tripod, a glass, or a stack of books to \nhold your phone in place while you draw',
      name: 'instructions_description',
      desc: '',
      args: [],
    );
  }

  /// `Aesthetics`
  String get aesthetics {
    return Intl.message(
      'Aesthetics',
      name: 'aesthetics',
      desc: '',
      args: [],
    );
  }

  /// `Cars`
  String get cars {
    return Intl.message(
      'Cars',
      name: 'cars',
      desc: '',
      args: [],
    );
  }

  /// `Drawing Lessons`
  String get drawing_lessons {
    return Intl.message(
      'Drawing Lessons',
      name: 'drawing_lessons',
      desc: '',
      args: [],
    );
  }

  /// `For Kids`
  String get for_kids {
    return Intl.message(
      'For Kids',
      name: 'for_kids',
      desc: '',
      args: [],
    );
  }

  /// `Nature`
  String get nature {
    return Intl.message(
      'Nature',
      name: 'nature',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get people {
    return Intl.message(
      'People',
      name: 'people',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Rate us`
  String get rate_us {
    return Intl.message(
      'Rate us',
      name: 'rate_us',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'pt'),
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
