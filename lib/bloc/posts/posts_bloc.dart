import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/posts/posts_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/posts/posts_state.dart';
import 'package:bloc_rest_api_clean_arch/model/posts_model.dart';
import 'package:bloc_rest_api_clean_arch/repository/posts_repository.dart';
import 'package:bloc_rest_api_clean_arch/utils/enums.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsRepository postsRepository;
  List<PostsModel> tempPostList = [];

  PostsBloc(this.postsRepository) : super(const PostsState()) {
    on<PostFetched>(fetchPosts);
    on<SearchItem>(searchItem);
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

  void searchItem(SearchItem event, Emitter<PostsState> emit) async {
    if (event.search.isEmpty) {
      emit(
        state.copyWith(
          tempPostList: [],
          searchMessage: '',
        ),
      );
    } else {
      // tempPostList = state.postsList
      //     .where(
      //       (element) => element.id.toString() == event.search.toString(),
      //     )
      //     .toList();
      tempPostList = state.postsList
          .where(
            (element) => element.email.toString().toLowerCase().contains(
                  event.search.toLowerCase(),
                ),
          )
          .toList();
      if (tempPostList.isEmpty) {
        emit(
          state.copyWith(
            tempPostList: tempPostList,
            searchMessage: 'No data found',
          ),
        );
      } else {
        emit(
          state.copyWith(
            tempPostList: tempPostList,
            searchMessage: '',
          ),
        );
      }
    }
  }
}
