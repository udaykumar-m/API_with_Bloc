part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class PostsInitialEvent extends PostsEvent {}

class PostsAddEvent extends PostsEvent {}
