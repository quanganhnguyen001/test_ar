import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState(currentIndex: 0)) {
    on<ChangeOnboardingEvent>((event, emit) {
      emit(state.copyWith(currentIndex: event.currentIndex));
    });
  }
}
