import 'package:flutter/material.dart';
import 'package:github_search/core/app_colors.dart';
import 'package:github_search/core/const/path_icons_const.dart';
import 'package:github_search/features/favorite_screen/presentation/provider/favorite_screen_view_model.dart';
import 'package:github_search/features/favorite_screen/presentation/screens/favorite_screen.dart';
import 'package:provider/provider.dart';

///
class FavoriteButtonWidget extends StatelessWidget {
  ///
  const FavoriteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<FavoriteScreenViewModel>();
    const double contSize = 44;

    return Container(
      width: contSize,
      height: contSize,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: InkWell(
        onTap: () {
          viewModel.load();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavoriteScreen(),
            ),
          );
        },
        child: Image.asset(PathIconsConst.favoriteActiveIcon),
      ),
    );

    // return ElevatedButton.icon(
    //   style: ElevatedButton.styleFrom(
    //     // fixedSize: const Size.fromHeight(44),
    //     foregroundColor: AppColors.secondaryColor,
    //     backgroundColor: AppColors.primaryColor,
    //     shape: RoundedRectangleBorder(
    //       // side: BorderSide.canMerge(a, b),
    //       borderRadius: BorderRadius.circular(12.0),
    //     ),
    //   ),
    //   onPressed: () {
    //     viewModel.load();
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const FavoriteScreen(),
    //       ),
    //     );
    //   },
    //   icon: const Icon(Icons.favorite),
    //   label: Text(''),
    // );
  }
}
