part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class ChangeOnboardingEvent extends OnboardingEvent {
  final int currentIndex;

  const ChangeOnboardingEvent({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
