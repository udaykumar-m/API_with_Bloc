import 'package:api_with_bloc/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          postsBloc.add(PostsAddEvent());
        },
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostsFetchingLoadingState:
              return Center(child: CircularProgressIndicator());
            case PostFetchingSuccessfulState:
              final successState = state as PostFetchingSuccessfulState;

              return Container(
                child: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text(
                            successState.posts[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(successState.posts[index].body)
                        ],
                      ),
                    );
                  },
                ),
              );
              break;
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
