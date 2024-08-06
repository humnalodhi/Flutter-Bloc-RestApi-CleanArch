import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/posts/posts_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/posts/posts_state.dart';
import 'package:bloc_rest_api_clean_arch/repository/posts_repository.dart';
import 'package:bloc_rest_api_clean_arch/utils/enums.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsRepository postsRepository;

  PostsBloc(this.postsRepository) : super(const PostsState()) {
    on<PostFetched>(fetchPosts);
  }

  void fetchPosts(PostFetched event, Emitter<PostsState> emit) async {
    await postsRepository.fetchPosts().then((value) {
      emit(
        state.copyWith(
          postsStatus: PostsStatus.success,
          message: 'Success',
          postsList: value,
        ),
      );
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
          postsStatus: PostsStatus.failure,
          message: error.toString(),
        ),
      );
    });
  }
}
