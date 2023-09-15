part of 'brightness_changer_bloc.dart';

sealed class BrightnessChangerEvent extends Equatable {
  const BrightnessChangerEvent();

  @override
  List<Object> get props => [];
}


final class ChangeBrightness extends BrightnessChangerEvent{}

final class LoadBrightness extends BrightnessChangerEvent {}
