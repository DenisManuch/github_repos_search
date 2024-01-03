import 'package:flutter/material.dart';
import 'package:github_search/core/const/names_string_const.dart';
import 'package:github_search/features/search_screen/presentation/widgets/app_bar_widget.dart';
import 'package:github_search/features/search_screen/presentation/widgets/fetch_body_list_widget.dart';
import 'package:github_search/features/search_screen/presentation/widgets/search_text_field_widget.dart';

///
class SearchScreen extends StatelessWidget {
  ///
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 64),
        child: AppBarWidget(
          appBarTitle: NamesStringConst.searchAppBarTitle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextFieldWidget(),
          Expanded(child: FetchBodyListWidget()),
          // ListOfRecentlyFoundRepositoriesWidget(),
        ],
      ),
    );
  }
}
