part of 'languages_bloc.dart';

class SettingsState extends Equatable {
  final int selectedIndex;
  final Locale locale;
  const SettingsState({required this.locale, required this.selectedIndex});

  @override
  List<Object> get props => [locale, selectedIndex];

  SettingsState copyWith({
    int? selectedIndex,
    Locale? locale,
  }) {
    return SettingsState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      locale: locale ?? this.locale,
    );
  }
}
