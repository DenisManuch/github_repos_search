import 'package:flutter/material.dart';
import 'package:github_search/features/favorite_screen/domain/favorite_screen_services.dart';
import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';
import 'package:github_search/features/search_screen/presentation/provider/search_screen_view_model.dart';

///
class FavoriteScreenViewModel extends ChangeNotifier {
  final FavoriteScreenServices _favoriteScreenServices =
      FavoriteScreenServices();
  final SearchScreenViewModel _searchScreenViewModel = SearchScreenViewModel();

  ///
  GitHubRepositoriesModel _state = GitHubRepositoriesModel.empty();

  ///
  GitHubRepositoriesModel get state => _state;

  ///
  FavoriteScreenViewModel() {
    load();
  }

  ///
  Future<void> load() async {
    await _favoriteScreenServices.loadFavoriteReposList();
    updateState();
  }

  ///
  ///
  Future<void> pushFavoriteButton(Item model, int index) async {
    await _favoriteScreenServices.delete(model, index);
    _searchScreenViewModel.onFavoritePress(index);
    updateState();
  }

  ///
  void updateState() {
    _state = _favoriteScreenServices.gitHubRepositoryModel;
    notifyListeners();
  }
}
