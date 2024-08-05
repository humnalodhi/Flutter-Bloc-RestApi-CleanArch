import 'package:bloc_rest_api_clean_arch/bloc/favorite_app/favorite_app_bloc.dart';
import 'package:bloc_rest_api_clean_arch/model/favorite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteAppScreen extends StatefulWidget {
  const FavoriteAppScreen({super.key});

  @override
  State<FavoriteAppScreen> createState() => _FavoriteAppScreenState();
}

class _FavoriteAppScreenState extends State<FavoriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteAppBloc>().add(
          FetchFavoriteList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite App'),
        centerTitle: true,
        actions: [
          BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavoriteList.isNotEmpty ? true : false,
                child: IconButton(
                  onPressed: () {
                    context.read<FavoriteAppBloc>().add(
                          DeleteItem(),
                        );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favoriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favoriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: state.tempFavoriteList.contains(item)
                              ? true
                              : false,
                          onChanged: (value) {
                            if (value!) {
                              context.read<FavoriteAppBloc>().add(
                                    SelectItem(
                                      item: item,
                                    ),
                                  );
                            } else {
                              context.read<FavoriteAppBloc>().add(
                                    UnSelectItem(
                                      item: item,
                                    ),
                                  );
                            }
                          },
                        ),
                        title: Text(
                          item.value.toString(),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<FavoriteAppBloc>().add(
                                  FavoriteItem(
                                    item: FavoriteItemModel(
                                      isFavorite: item.isFavorite ? false : true,
                                      id: item.id,
                                      value: item.value,
                                    ),
                                  ),
                                );
                          },
                          icon: Icon(
                            item.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                          ),
                        ),
                      ),
                    );
                  },
                );
              case ListStatus.failure:
                return const Text(
                  'Something went wrong',
                );
            }
          },
        ),
      ),
    );
  }
}
