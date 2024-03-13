part of 'draw_using_template_bloc.dart';

class DrawUsingTemplateState extends Equatable {
  const DrawUsingTemplateState(
      {required this.currentValue,
      required this.isFlash,
      required this.isFlip,
      required this.isLock});
  final double currentValue;
  final bool isFlash;
  final bool isFlip;
  final bool isLock;

  @override
  List<Object> get props => [currentValue, isFlash, isFlip, isLock];

  DrawUsingTemplateState copyWith({
    double? currentValue,
    bool? isFlash,
    bool? isFlip,
    bool? isLock,
  }) {
    return DrawUsingTemplateState(
        currentValue: currentValue ?? this.currentValue,
        isFlash: isFlash ?? this.isFlash,
        isFlip: isFlip ?? this.isFlip,
        isLock: isLock ?? this.isLock);
  }
}
