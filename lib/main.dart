import 'package:flutter/material.dart';
import 'package:github_search/core/app_colors.dart';
import 'package:github_search/core/const/fonts_string_const.dart';
import 'package:github_search/features/favorite_screen/presentation/provider/favorite_screen_view_model.dart';
import 'package:github_search/features/loading_screen/presentation/screens/loading_screen.dart';
import 'package:github_search/features/search_screen/domain/entity/git_hub_repositories_model.dart';
import 'package:github_search/features/search_screen/presentation/provider/search_screen_view_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart' as provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GitHubRepositoriesModelAdapter());
  Hive.registerAdapter(ItemAdapter());

  runApp(
    provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<SearchScreenViewModel>(
          create: (_) => SearchScreenViewModel(),
        ),
        provider.ChangeNotifierProvider<FavoriteScreenViewModel>(
          create: (_) => FavoriteScreenViewModel(),
        ),
      ],
      child: const Main(),
    ),
  );
}

///
class Main extends StatelessWidget {
  ///
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontFamily: FontsStringConst.ralewayFont,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.mainColor,
          titleTextStyle: TextStyle(
            fontFamily: FontsStringConst.ralewayFont,
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}
