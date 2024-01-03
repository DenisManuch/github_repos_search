import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
class FavoriteScreenDataProvider {
  ///
  static const String repositoriesBoxTitle = 'repositories_box';

  ///
  Future<GitHubRepositoriesModel> loadFavoriteRepositoriesInHive() async {
    final repListBox = await Hive.openBox<Item>(repositoriesBoxTitle);
    final list = GitHubRepositoriesModel.empty();
    final keys = repListBox.keys;
    for (final element in keys) {
      list.items.add(
        repListBox.get(element, defaultValue: Item.empty()) ?? Item.empty(),
      );
    }

    return list;
  }

  ///
  Future<bool> checkReposInFavorite(int id) async {
    final repListBox = await Hive.openBox<Item>(repositoriesBoxTitle);

    return repListBox.containsKey(id);
  }

  ///
  Future<void> saveOrDeleteFavoriteRepositoriesInHive(
    Item model,
  ) async {
    final Box repListBox = await Hive.openBox<Item>(repositoriesBoxTitle);
    if (repListBox.containsKey(model.id)) {
      await repListBox.delete(model.id);

      return;
    }
    await repListBox.put(model.id, model);
  }

  ///
  Future<void> deleteRepositoriesFromFavoriteInHive(int key) async {
    final Box repListBox = await Hive.openBox<Item>(repositoriesBoxTitle);
    await repListBox.deleteAt(key);
  }
}
