import 'package:bloc_rest_api_clean_arch/model/posts_model.dart';
import 'package:bloc_rest_api_clean_arch/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostsState extends Equatable {
  final PostsStatus postsStatus;
  final List<PostsModel> postsList;
  final List<PostsModel> tempPostList;
  final String message;
  final String searchMessage;

  const PostsState({
    this.postsStatus = PostsStatus.loading,
    this.postsList = const <PostsModel>[],
    this.tempPostList = const <PostsModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  PostsState copyWith({
    PostsStatus? postsStatus,
    List<PostsModel>? postsList,
    List<PostsModel>? tempPostList,
    String? message,
    String? searchMessage,
  }) {
    return PostsState(
      postsStatus: postsStatus ?? this.postsStatus,
      postsList: postsList ?? this.postsList,
      tempPostList: tempPostList ?? this.tempPostList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props => [
        postsStatus,
        postsList,
        tempPostList,
        message,
        searchMessage,
      ];
}
