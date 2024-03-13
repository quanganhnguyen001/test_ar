part of 'permission_bloc.dart';

sealed class PermissionEvent extends Equatable {
  const PermissionEvent();

  @override
  List<Object> get props => [];
}

class LoadSwitchEvent extends PermissionEvent {
  @override
  List<Object> get props => [];
}

class SaveSwitchEvent extends PermissionEvent {
  final bool switchValue;

  const SaveSwitchEvent({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}
