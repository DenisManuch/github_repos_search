import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_search/core/app_colors.dart';
import 'package:github_search/core/const/names_string_const.dart';
import 'package:github_search/features/search_screen/presentation/screens/search_screen.dart';

///
class LoadingScreen extends StatefulWidget {
  ///
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SearchScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              NamesStringConst.searchAppBarTitle,
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CupertinoActivityIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
