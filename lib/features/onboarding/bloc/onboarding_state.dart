part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final int currentIndex;
  const OnboardingState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];

  OnboardingState copyWith({
    int? currentIndex,
  }) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
