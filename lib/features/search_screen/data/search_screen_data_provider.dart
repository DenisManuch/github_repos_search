import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
class SearchScreenDataProvider {
  ///
  static const String historyRepositoriesBoxTitle = 'last_repositories_box';

  ///
  Future<void> addToSearchHistoryInHive(
    GitHubRepositoriesModel itemModel,
  ) async {
    final hisRepBox = await Hive.openBox<Item>(
      historyRepositoriesBoxTitle,
    );

    final list = {for (final e in itemModel.items) e.id: e};
    await hisRepBox.putAll(list);
  }

  ///
  Future<GitHubRepositoriesModel> loadHistoryRepositoriesInHive() async {
    final hisRepBox = await Hive.openBox<Item>(historyRepositoriesBoxTitle);
    final list = GitHubRepositoriesModel.empty();
    final keys = hisRepBox.keys;
    for (final element in keys) {
      hisRepBox.get(element);
      list.items.add(
        hisRepBox.get(element) ?? Item.empty(),
      );
    }

    return list;
  }
}
