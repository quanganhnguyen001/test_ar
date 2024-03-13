part of 'permission_bloc.dart';

class PermissionState extends Equatable {
  const PermissionState();

  @override
  List<Object> get props => [];
}

class PermissionInitial extends PermissionState {}

class SwitchLoaded extends PermissionState {
  final bool switchValue;

  const SwitchLoaded(this.switchValue);

  @override
  List<Object> get props => [switchValue];

  SwitchLoaded copyWith({
    bool? switchValue,
  }) {
    return SwitchLoaded(
      switchValue ?? this.switchValue,
    );
  }
}
