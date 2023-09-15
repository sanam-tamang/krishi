import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {}

class InternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}
