part of 'favorite_app_bloc.dart';

enum ListStatus {
  loading,
  success,
  failure,
}

class FavoriteAppState extends Equatable {
  final List<FavoriteItemModel> favoriteItemList;
  final List<FavoriteItemModel> tempFavoriteList;
  final ListStatus listStatus;

  const FavoriteAppState({
    this.favoriteItemList = const [],
    this.tempFavoriteList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavoriteAppState copyWith({
    List<FavoriteItemModel>? favoriteItemList,
    List<FavoriteItemModel>? tempFavoriteList,
    ListStatus? listStatus,
  }) {
    return FavoriteAppState(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
      tempFavoriteList: tempFavoriteList ?? this.tempFavoriteList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [
        favoriteItemList,
        tempFavoriteList,
        listStatus,
      ];
}
