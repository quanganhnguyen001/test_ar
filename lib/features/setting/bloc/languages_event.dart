part of 'languages_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingSubmitLanguageEvent extends SettingsEvent {
  final Locale locale;
  final int selectedIndex;

  const SettingSubmitLanguageEvent(
      {required this.locale, required this.selectedIndex});

  @override
  List<Object> get props => [locale, selectedIndex];
}
