import 'package:flutter/material.dart';
import 'package:github_search/features/search_screen/presentation/widgets/favorite_button_widget.dart';

///
class AppBarWidget extends StatelessWidget {
  ///
  final String appBarTitle;

  ///
  const AppBarWidget({required this.appBarTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15.5),
      child: AppBar(
        title: Text(appBarTitle),
        actions: const [FavoriteButtonWidget()],
      ),
    );
  }
}
