import 'package:flutter/material.dart';
import 'package:github_search/core/app_colors.dart';
import 'package:github_search/core/const/path_icons_const.dart';
import 'package:github_search/features/favorite_screen/presentation/provider/favorite_screen_view_model.dart';
import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';
import 'package:provider/provider.dart';

///
class FavoriteCardReposWidget extends StatelessWidget {
  ///
  final int indexList;

  ///
  final Item itemModel;

  ///
  const FavoriteCardReposWidget({
    required this.indexList,
    required this.itemModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<FavoriteScreenViewModel>();

    void pushButton(int index, Item itemModel) {
      viewModel.pushFavoriteButton(itemModel, index);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: Text(itemModel.fullName),
          // subtitle: Text(itemModel.description ?? ''),
          trailing: itemModel.favorite
              ? Image.asset(
                  PathIconsConst.favoriteActiveIcon,
                  color: AppColors.primaryColor,
                )
              : Image.asset(
                  PathIconsConst.favoriteDefaultIcon,
                  color: AppColors.placeholderColor,
                ),
          onTap: () => pushButton(
            indexList,
            itemModel,
          ),
        ),
      ),
    );
  }
}
