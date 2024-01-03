import 'package:flutter/material.dart';
import 'package:github_search/features/search_screen/presentation/provider/search_screen_view_model.dart';
import 'package:github_search/features/search_screen/presentation/widgets/card_repos_widget.dart';
import 'package:provider/provider.dart';

///
class ListOfRecentlyFoundRepositoriesWidget extends StatelessWidget {
  ///
  const ListOfRecentlyFoundRepositoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchScreenViewModel>().state.items;

    return Expanded(
      child: ListView.builder(
        itemCount: viewModel.length,
        itemBuilder: (context, index) =>
            CardReposWidget(indexList: index, itemModel: viewModel[index]),
      ),
    );
  }
}
