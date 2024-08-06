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
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search with email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (filterKey) {
                        context.read<PostsBloc>().add(
                              SearchItem(filterKey),
                            );
                      },
                    ),
                    Expanded(
                      child: state.searchMessage.isNotEmpty
                          ? Center(
                              child: Text(
                                state.searchMessage.toString(),
                              ),
                            )
                          : ListView.builder(
                              itemCount: state.tempPostList.isEmpty
                                  ? state.postsList.length
                                  : state.tempPostList.length,
                              itemBuilder: (context, index) {
                                final item = state.tempPostList.isEmpty
                                    ? state.postsList[index]
                                    : state.tempPostList[index];
                                return ListTile(
                                  title: Text(
                                    item.email.toString(),
                                  ),
                                  subtitle: Text(
                                    item.body.toString(),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
