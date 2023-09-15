
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../post/blocs/get_post_bloc/get_post_bloc.dart';
import '../../../post/models/post_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late final GetPostBloc _postBloc;
  SearchBloc({required GetPostBloc bloc})
      : _postBloc = bloc,
        super(SearchInitial()) {
    on<SearchPostModel>(_onPostSearch);
    on<ClearSearchPostModel>(_onClearSearchPost);
  }

  void _onPostSearch(SearchPostModel event, Emitter<SearchState> emit) {
    final postState = _postBloc.state;
    if (postState is GetPostLoaded) {
      final List<PostModel> posts = List.from(postState.posts);
      List<PostModel> searchedPosts = posts
          .where((post) =>
              post.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      if (searchedPosts.isEmpty) {
        emit(SearchNotFound());
        return;
      }

      emit(SearchLoaded(posts: searchedPosts));
    }
  }

  void _onClearSearchPost(
      ClearSearchPostModel event, Emitter<SearchState> emit) {
    final state = this.state;
    if (state is SearchLoaded) {
      emit(SearchInitial());
    }
  }
}
