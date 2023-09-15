part of 'get_post_bloc.dart';

sealed class GetPostState extends Equatable {
  const GetPostState();

  @override
  List<Object> get props => [];
}

final class GetPostInitial extends GetPostState {}

final class GetPostLoading extends GetPostState {}

final class GetPostLoaded extends GetPostState {
  final List<PostModel> posts;

 const  GetPostLoaded({required this.posts});
  
}

final class GetPostFailure extends GetPostState {
  final String message;

  const GetPostFailure({required this.message});
 
 
}
