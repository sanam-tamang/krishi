import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/failure_message.dart';
import '../../models/post_model.dart';
import '../../repositories/post_repository.dart';

part 'get_post_event.dart';
part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  late final PostRepository _postRepository;
  GetPostBloc({required PostRepository repository})
      : _postRepository = repository,
        super(GetPostInitial()) {
    on<GetPosts>(_onGetPosts);
  }

  Future<void> _onGetPosts(GetPosts event, Emitter<GetPostState> emit) async {
    emit(GetPostLoading());
      final posts = await _postRepository.getPosts();
      posts.fold(
          (failure) =>
              emit(GetPostFailure(message: FailureMessage().call(failure))),
          (posts) => emit(GetPostLoaded(posts: posts)));
    
  }
}
