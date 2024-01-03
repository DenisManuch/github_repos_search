import 'package:github_search/features/favorite_screen/data/favorite_screen_data_provider.dart';
import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';

///
class FavoriteScreenServices {
  ///
  final FavoriteScreenDataProvider _favoriteScreenDataProvider =
      FavoriteScreenDataProvider();

  ///
  GitHubRepositoriesModel _gitHubRepositoriesModel =
      GitHubRepositoriesModel.empty();

  ///
  GitHubRepositoriesModel get gitHubRepositoryModel => _gitHubRepositoriesModel;

  ///
  Future<void> loadFavoriteReposList() async {
    _gitHubRepositoriesModel =
        await _favoriteScreenDataProvider.loadFavoriteRepositoriesInHive();
    // _gitHubRepositoriesModel = list;
  }

  

  ///
  Future<void> delete(Item model, int index) async {
    _gitHubRepositoriesModel.items.removeAt(index);
    await _favoriteScreenDataProvider
        .saveOrDeleteFavoriteRepositoriesInHive(model);
  }
}
