import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../datasource/theme_mode_local_data_source.dart';

part 'brightness_changer_event.dart';
part 'brightness_changer_state.dart';

class BrightnessChangerBloc
    extends Bloc<BrightnessChangerEvent, BrightnessChangerState> {
  BrightnessChangerBloc() : super(const BrightnessChangerState()) {
    on<ChangeBrightness>(_onChangeBrightness);
    on<LoadBrightness>(_onLoadBrightness);
  }

  Future<void> _onLoadBrightness(
      LoadBrightness event, Emitter<BrightnessChangerState> emit) async {
    try {
      final theme = await ThemeModeLocalDataSource.instance.getTheme();
      emit(BrightnessChangerState(brightness: theme));
    } catch (e) {
      emit(const BrightnessChangerState(brightness: ThemeMode.light));
    }
  }

 Future<void> _onChangeBrightness(
    ChangeBrightness event,
    Emitter<BrightnessChangerState> emit,
  ) async {
    final state = this.state;
    final currentTheme =
        state.brightness == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    await ThemeModeLocalDataSource.instance.saveTheme(currentTheme);

    emit(BrightnessChangerState(brightness: currentTheme));
  }

}
