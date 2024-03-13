part of 'languages_bloc.dart';

sealed class LanguagesEvent extends Equatable {
  const LanguagesEvent();

  @override
  List<Object> get props => [];
}

class SubmitLanguageEvent extends LanguagesEvent {
  final Locale locale;
  final int selectedIndex;

  const SubmitLanguageEvent(
      {required this.locale, required this.selectedIndex});

  @override
  List<Object> get props => [locale, selectedIndex];
}
