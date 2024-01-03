import 'package:flutter/material.dart';
import 'package:github_search/core/app_colors.dart';
import 'package:github_search/core/const/path_icons_const.dart';
import 'package:github_search/core/const/size_const.dart';
import 'package:github_search/features/search_screen/presentation/provider/search_screen_view_model.dart';
import 'package:provider/provider.dart';

///
class SearchTextFieldWidget extends StatelessWidget {
  ///
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchScreenViewModel>();
    final TextEditingController searchTextFieldController =
        TextEditingController();

    ///
    void searchReposByName(String inputText) {
      viewModel.searchReposButton(inputText);
    }

    ///
    void clearTextFieldAndLoadHistory() {
      searchTextFieldController.clear();
      viewModel.loadHistory();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: SizeConst.searchTextFieldHeight,
        child: TextField(
          controller: searchTextFieldController,
          onTap: viewModel.clearHistory,
          onSubmitted: searchReposByName,
          decoration: InputDecoration(
            filled: true,
            fillColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return AppColors.secondaryColor;
              }

              return AppColors.layer1Color;
            }),
            prefixIcon: Image.asset(PathIconsConst.searchIcon),
            suffixIcon: searchTextFieldController.text.isEmpty
                ? IconButton(
                    onPressed: clearTextFieldAndLoadHistory,
                    icon: Image.asset(PathIconsConst.closeIcon),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(SizeConst.searchTextFieldBorderRadius),
              borderSide: BorderSide.none,
            ),
            focusColor: AppColors.primaryColor,
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(SizeConst.searchTextFieldBorderRadius),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
