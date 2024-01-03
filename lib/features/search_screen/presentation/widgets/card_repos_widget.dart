import 'package:flutter/material.dart';
import 'package:github_search/core/app_colors.dart';
import 'package:github_search/core/const/path_icons_const.dart';
import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';
import 'package:github_search/features/search_screen/presentation/provider/search_screen_view_model.dart';
import 'package:provider/provider.dart';

///
class CardReposWidget extends StatelessWidget {
  ///
  final int indexList;

  ///
  final Item itemModel;

  ///
  const CardReposWidget({
    required this.indexList,
    required this.itemModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchScreenViewModel>();

    void pushButton(int index) {
      viewModel.onFavoritePress(index);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: Text(
            itemModel.fullName,
            style: Theme.of(context).textTheme.bodySmall,
          ),
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
          ),
        ),
      ),
    );
  }
}
