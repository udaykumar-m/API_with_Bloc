part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class PostsInitialEvent extends PostsEvent {}

class PostAddEvent extends PostsEvent {}
