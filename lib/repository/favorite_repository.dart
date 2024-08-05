import 'package:bloc_rest_api_clean_arch/model/favorite_item_model.dart';

class FavoriteRepository {
  Future<List<FavoriteItemModel>> fetchItem() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    return List.of(
      generateList(10),
    );
  }

  List<FavoriteItemModel> generateList(int length) {
    return List.generate(
      length,
      (index) => FavoriteItemModel(
        id: index.toString(),
        value: 'Item $index',
      ),
    );
  }
}
