import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'languages_event.dart';
part 'languages_state.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  LanguagesBloc()
      : super(const LanguagesState(locale: Locale('en'), selectedIndex: 0)) {
    on<SubmitLanguageEvent>((event, emit) {
      emit(state.copyWith(
          locale: event.locale, selectedIndex: event.selectedIndex));
    });
  }
}
