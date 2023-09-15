import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../common/api.dart';
import '../../../core/error/failures.dart';
import '../../../core/internet/internet_connection_checker.dart';
import '../../../core/typedef/typedef.dart';

import '../models/post_model.dart';

abstract class BasePostRepository {
  FutureData<List<PostModel>> getPosts();
}

class PostRepository implements BasePostRepository {
  @override
  FutureData<List<PostModel>> getPosts() async {
    if (await CustomInternetConnectionChecker().isConnected==false) {
      return Left(InternetConnectionFailure());
    }
    try {
      final response = await http.get(Uri.parse(Api.post));
      if (response.statusCode == 200) {
        final decodedPosts = jsonDecode(response.body);
        ///this function parse map into object and it will only take 8 metadata for testing purpose
        final List<PostModel> posts = List.from(decodedPosts).take(8)
            .map((post) => PostModel.fromMap(post))
            .toList();
        return Right(posts);
      } else {
        return Left(ServerFailure());
      }
    } on SocketException {
      return Left(InternetConnectionFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
