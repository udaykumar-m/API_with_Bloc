part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

abstract class PostActionState extends PostsState {}

final class PostsInitial extends PostsState {}

class PostsFetchingLoadingState extends PostsState {}

class PostFetchingErrorState extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;

  PostFetchingSuccessfulState({required this.posts});
}

class PostsAdditionSuccessState extends PostActionState {}

class PostsAdditionErrorState extends PostActionState {}
