// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'brightness_changer_bloc.dart';

class BrightnessChangerState extends Equatable {
  const BrightnessChangerState({
    this.brightness = ThemeMode.light}
  );
  final ThemeMode brightness;

  @override
  List<Object> get props => [brightness];
}
