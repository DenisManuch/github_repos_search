import 'package:flutter/material.dart';
import 'package:github_search/core/const/names_string_const.dart';
import 'package:github_search/features/favorite_screen/presentation/provider/favorite_screen_view_model.dart';
import 'package:github_search/features/favorite_screen/presentation/widgets/favorite_card_repos_widget.dart';
import 'package:github_search/features/search_screen/presentation/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

///
class FavoriteScreen extends StatelessWidget {
  ///
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoriteScreenViewModel>();
    final vm = context.select((FavoriteScreenViewModel test) => test);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 64),
        child: AppBarWidget(
          appBarTitle: NamesStringConst.favoriteAppBarTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: vm.state.items.length,
        itemBuilder: (context, index) => FavoriteCardReposWidget(
          indexList: index,
          itemModel: viewModel.state.items[index],
        ),
      ),
    );
  }
}
