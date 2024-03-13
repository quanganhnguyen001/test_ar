part of 'draw_using_template_bloc.dart';

class DrawUsingTemplateEvent extends Equatable {
  const DrawUsingTemplateEvent();

  @override
  List<Object> get props => [];
}

class OpacityEvent extends DrawUsingTemplateEvent {
  final double currentValue;

  const OpacityEvent({required this.currentValue});

  @override
  List<Object> get props => [currentValue];
}

class FlashEvent extends DrawUsingTemplateEvent {
  final bool isFlash;

  const FlashEvent({required this.isFlash});

  @override
  List<Object> get props => [isFlash];
}

class FlipEvent extends DrawUsingTemplateEvent {
  final bool isFlip;

  const FlipEvent({required this.isFlip});

  @override
  List<Object> get props => [isFlip];
}

class LockEvent extends DrawUsingTemplateEvent {
  final bool isLock;

  const LockEvent({required this.isLock});

  @override
  List<Object> get props => [isLock];
}
