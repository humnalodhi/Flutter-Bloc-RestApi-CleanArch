import 'package:bloc_rest_api_clean_arch/bloc/posts/posts_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/posts/posts_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/posts/posts_state.dart';
import 'package:bloc_rest_api_clean_arch/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    context.read<PostsBloc>().add(PostFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.postsStatus) {
            case PostsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostsStatus.failure:
              return Center(
                child: Text(
                  state.message.toString(),
                ),
              );
            case PostsStatus.success:
              return ListView.builder(
                itemCount: state.postsList.length,
                itemBuilder: (context, index) {
                  final item = state.postsList[index];
                  return ListTile(
                    title: Text(
                      item.email.toString(),
                    ),
                    subtitle: Text(
                      item.body.toString(),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
