import 'package:flutter/material.dart';
import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';
import 'package:github_search/features/search_screen/domain/services/search_screen_service.dart';

///
class SearchScreenViewModel extends ChangeNotifier {
  final SearchScreenService _searchScreenService = SearchScreenService();

  GitHubRepositoriesModel _state = GitHubRepositoriesModel.empty();

  ///
  GitHubRepositoriesModel get state => _state;

  ///
  SearchScreenViewModel() {
    loadHistory();
  }

  ///
  Future<void> searchReposButton(String searchRepos) async {
    await _searchScreenService
        .fetchRepositorys(searchRepos.toLowerCase().trim());
    updateState();
  }

  ///
  void onFavoritePress(int index) {
    _searchScreenService.addToFavorite(index);
    updateState();
  }

  ///
  Future<void> loadHistory() async {
    await _searchScreenService.loadHistory();
    updateState();
  }

  ///
  void clearHistory() {
    _searchScreenService.clearHistory();
    updateState();
  }

  ///
  void updateState() {
    _state = _searchScreenService.gitHubRepositoryModel;
    notifyListeners();
  }
}
