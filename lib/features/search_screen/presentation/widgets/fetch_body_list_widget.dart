import 'package:flutter/widgets.dart';
import 'package:github_search/features/search_screen/presentation/provider/search_screen_view_model.dart';
import 'package:github_search/features/search_screen/presentation/widgets/card_repos_widget.dart';
import 'package:provider/provider.dart';

///
class FetchBodyListWidget extends StatelessWidget {
  ///
  const FetchBodyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchScreenViewModel>().state;

    return ListView.builder(
      itemCount: viewModel.items.length,
      itemBuilder: (context, index) => CardReposWidget(
        indexList: index,
        itemModel: viewModel.items[index],
      ),
    );
  }
}
