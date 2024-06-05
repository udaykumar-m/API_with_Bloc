import 'dart:async';

import 'package:api_with_bloc/features/models/post_data_ui_model.dart';
import 'package:api_with_bloc/features/posts/repos/posts_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialEvent>(postsInitialEvent);
    on<PostsAddEvent>(postsAddEvent);
  }

  FutureOr<void> postsInitialEvent(
      PostsInitialEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> post = await PostsRepo.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: post));
  }

  FutureOr<void> postsAddEvent(
      PostsAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPosts();
    if (success) {
      emit(PostsAdditionSuccessState());
    } else {
      emit(PostsAdditionErrorState());
    }
  }
}
