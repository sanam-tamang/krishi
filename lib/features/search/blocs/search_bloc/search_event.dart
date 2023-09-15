part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchPostModel extends SearchEvent {
  final String query;

  const SearchPostModel({required this.query});


}


class ClearSearchPostModel extends SearchEvent{}