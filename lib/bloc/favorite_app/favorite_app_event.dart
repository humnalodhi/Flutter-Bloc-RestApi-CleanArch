part of 'favorite_app_bloc.dart';

abstract class FavoriteAppEvent extends Equatable {
  const FavoriteAppEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavoriteList extends FavoriteAppEvent {}
class DeleteItem extends FavoriteAppEvent {}

class FavoriteItem extends FavoriteAppEvent {
  final FavoriteItemModel item;

  const FavoriteItem({
    required this.item,
  });
}

class SelectItem extends FavoriteAppEvent {
  final FavoriteItemModel item;

  const SelectItem({
    required this.item,
  });
}

class UnSelectItem extends FavoriteAppEvent {
  final FavoriteItemModel item;

  const UnSelectItem({
    required this.item,
  });
}
