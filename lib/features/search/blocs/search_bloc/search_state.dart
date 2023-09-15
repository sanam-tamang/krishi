part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<PostModel> posts;

  const SearchLoaded({required this.posts});
}


final class SearchNotFound extends SearchState{
  
}