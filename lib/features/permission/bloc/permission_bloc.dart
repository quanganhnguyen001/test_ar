import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionInitial()) {
    on<LoadSwitchEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool switchValue = prefs.getBool('switchValue') ?? false;
      emit(SwitchLoaded(switchValue));
    });

    on<SaveSwitchEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('switchValue', event.switchValue);
      emit(SwitchLoaded(event.switchValue));
      checkPermission();
    });
  }

  Future<void> checkPermission() async {
    await Permission.camera.request();
    await Permission.photos.request();
    await Permission.storage.request();
    await Permission.microphone.request();
  }
}
