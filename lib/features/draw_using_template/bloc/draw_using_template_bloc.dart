import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'draw_using_template_event.dart';
part 'draw_using_template_state.dart';

class DrawUsingTemplateBloc
    extends Bloc<DrawUsingTemplateEvent, DrawUsingTemplateState> {
  DrawUsingTemplateBloc()
      : super(const DrawUsingTemplateState(
            currentValue: 50, isFlash: false, isFlip: false, isLock: false)) {
    on<OpacityEvent>((event, emit) {
      emit(state.copyWith(currentValue: event.currentValue));
    });

    on<FlashEvent>((event, emit) {
      emit(state.copyWith(isFlash: event.isFlash));
    });

    on<FlipEvent>((event, emit) {
      emit(state.copyWith(isFlip: event.isFlip));
    });

    on<LockEvent>((event, emit) {
      emit(state.copyWith(isLock: event.isLock));
    });
  }
}
