import 'package:dartz/dartz.dart';
import '../error/failures.dart';

///helps to return future with either type and data with generic type
///
typedef FutureData<T> = Future<Either<Failure, T>>;
