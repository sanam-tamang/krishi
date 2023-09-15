import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseInternetConnectionChecker {
  Future<bool> get isConnected;
}

///check internet state
class CustomInternetConnectionChecker implements BaseInternetConnectionChecker {
  final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker();
  @override
  Future<bool> get isConnected async => await _internetConnectionChecker.hasConnection;
}
