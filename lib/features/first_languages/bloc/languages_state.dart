part of 'languages_bloc.dart';

class LanguagesState extends Equatable {
  final int selectedIndex;
  final Locale locale;
  const LanguagesState({required this.locale, required this.selectedIndex});

  @override
  List<Object> get props => [locale.languageCode, selectedIndex];

  LanguagesState copyWith({
    int? selectedIndex,
    Locale? locale,
  }) {
    return LanguagesState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      locale: locale ?? this.locale,
    );
  }
}
