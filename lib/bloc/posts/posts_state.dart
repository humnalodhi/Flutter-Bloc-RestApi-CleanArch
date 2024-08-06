import 'package:bloc_rest_api_clean_arch/model/posts_model.dart';
import 'package:bloc_rest_api_clean_arch/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostsState extends Equatable {
  final PostsStatus postsStatus;
  final List<PostsModel> postsList;
  final String message;

  const PostsState({
    this.postsStatus = PostsStatus.loading,
    this.postsList = const <PostsModel>[],
    this.message = '',
  });

  PostsState copyWith({
    PostsStatus? postsStatus,
    List<PostsModel>? postsList,
    String? message,
  }) {
    return PostsState(
      postsStatus: postsStatus ?? this.postsStatus,
      postsList: postsList ?? this.postsList,
      message: message ?? this.message,
    );
  }

  List<Object> get props => [
        postsStatus,
        postsList,
        message,
      ];
}
