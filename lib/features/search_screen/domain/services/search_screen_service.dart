import 'package:flutter/material.dart';
import 'package:github_search/core/domain/api/git_hub_api_repository.dart';
import 'package:github_search/features/favorite_screen/data/favorite_screen_data_provider.dart';
import 'package:github_search/features/search_screen/data/search_screen_data_provider.dart';
import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';

///
class SearchScreenService {
  final _gitHubApiRepository = GitHubApiRepository();
  final _favoriteScreenDataProvider = FavoriteScreenDataProvider();
  final _searchScreenDataProvider = SearchScreenDataProvider();

  ///
  GitHubRepositoriesModel _gitHubRepositoriesModel =
      GitHubRepositoriesModel.empty();

  ///
  GitHubRepositoriesModel get gitHubRepositoryModel => _gitHubRepositoriesModel;

  ///
  Future<void> fetchRepositorys(String reposName) async {
    try {
      if (reposName.trim() == '') {
        await loadHistory();

        return;
      }
      final String data =
          await _gitHubApiRepository.fetchGitHubRepositoryByName(reposName);

      final modelList = GitHubRepositoriesModel.fromRawJson(data);

      for (final element in modelList.items) {
        element.favorite =
            await _favoriteScreenDataProvider.checkReposInFavorite(element.id);
        _gitHubRepositoriesModel.items.add(element);
      }
      addToHistory(_gitHubRepositoriesModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///
  void addToFavorite(int index) {
    final model = _gitHubRepositoriesModel.items[index];
    model.favorite = !model.favorite;
    // _gitHubRepositoriesModel.items[index].favorite =
    //     !_gitHubRepositoriesModel.items[index].favorite;
    _favoriteScreenDataProvider.saveOrDeleteFavoriteRepositoriesInHive(model);
  }

  ///
  void addToHistory(GitHubRepositoriesModel itemModel) {
    _searchScreenDataProvider.addToSearchHistoryInHive(itemModel);
  }

  ///
  Future<void> loadHistory() async {
    _gitHubRepositoriesModel =
        await _searchScreenDataProvider.loadHistoryRepositoriesInHive();
  }

  ///
  void clearHistory() {
    _gitHubRepositoriesModel.items.clear();
  }
}
