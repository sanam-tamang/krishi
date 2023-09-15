import '../error/failures.dart';

///failure message to show
class FailureMessage {
  static const noInternetConnection = 'No Internet Connection';
  static const  internalServerError = 'Internal ServerError';

  String call(Failure failure) {
    switch (failure.runtimeType) {
      case InternetConnectionFailure:
        return noInternetConnection;
      case ServerFailure:
        return internalServerError;
      default:
        return 'Something went wrong';
    }
  }
}
