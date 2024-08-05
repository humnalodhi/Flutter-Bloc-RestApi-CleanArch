import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api_clean_arch/model/favorite_item_model.dart';
import 'package:bloc_rest_api_clean_arch/repository/favorite_repository.dart';
import 'package:equatable/equatable.dart';

part 'favorite_app_event.dart';

part 'favorite_app_state.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvent, FavoriteAppState> {
  List<FavoriteItemModel> favoriteList = [];
  List<FavoriteItemModel> tempFavoriteList = [];
  FavoriteRepository favoriteRepository;

  FavoriteAppBloc(this.favoriteRepository) : super(const FavoriteAppState()) {
    on<FetchFavoriteList>(fetchList);
    on<FavoriteItem>(addFavoriteItem);
    on<SelectItem>(selectItem);
    on<UnSelectItem>(unSelectItem);
    on<DeleteItem>(deleteItem);
  }

  void fetchList(
      FetchFavoriteList event, Emitter<FavoriteAppState> emit) async {
    favoriteList = await favoriteRepository.fetchItem();
    emit(
      state.copyWith(
        favoriteItemList: List.from(favoriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void selectItem(SelectItem event, Emitter<FavoriteAppState> emit) async {
    tempFavoriteList.add(
      event.item,
    );
    emit(
      state.copyWith(
        tempFavoriteList: List.from(
          tempFavoriteList,
        ),
      ),
    );
  }

  void unSelectItem(UnSelectItem event, Emitter<FavoriteAppState> emit) async {
    tempFavoriteList.remove(
      event.item,
    );
    emit(
      state.copyWith(
        tempFavoriteList: List.from(
          tempFavoriteList,
        ),
      ),
    );
  }

  void addFavoriteItem(
      FavoriteItem event, Emitter<FavoriteAppState> emit) async {
    final index = favoriteList.indexWhere(
      (element) => element.id == event.item.id,
    );
    if (event.item.isFavorite) {
      if (tempFavoriteList.contains(
        favoriteList[index],
      )) {
        tempFavoriteList.remove(
          favoriteList[index],
        );
        tempFavoriteList.add(event.item);
      }
    } else {
      if (tempFavoriteList.contains(favoriteList[index])) {
        tempFavoriteList.remove(favoriteList[index]);
        tempFavoriteList.add(event.item);
      }
    }
    favoriteList[index] = event.item;
    emit(
      state.copyWith(
        favoriteItemList: List.from(favoriteList),
      ),
    );
  }

  void deleteItem(DeleteItem event, Emitter<FavoriteAppState> emit) {
    for (int i = 0; i < tempFavoriteList.length; i++) {
      favoriteList.remove(tempFavoriteList[i]);
    }
    tempFavoriteList.clear();
    emit(
      state.copyWith(
        favoriteItemList: List.from(favoriteList),
        tempFavoriteList: List.from(tempFavoriteList),
      ),
    );
  }
}
