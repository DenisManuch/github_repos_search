import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'git_hub_repositories_model.g.dart';

@HiveType(typeId: 1)

///
class GitHubRepositoriesModel {
  @HiveField(0)

  ///
  List<Item> items;

  ///
  GitHubRepositoriesModel({
    required this.items,
  });

  ///
  factory GitHubRepositoriesModel.empty() => GitHubRepositoriesModel(items: []);

  ///
  factory GitHubRepositoriesModel.fromRawJson(String str) =>
      GitHubRepositoriesModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  ///
  factory GitHubRepositoriesModel.fromJson(Map<String, dynamic> json) =>
      GitHubRepositoriesModel(
        items: List<Item>.from(
          json["items"].map(
            (dynamic x) => Item.fromJson(x as Map<String, dynamic>),
          ) as Iterable,
        ),
      );

  ///
  GitHubRepositoriesModel copyWith({
    List<Item>? items,
  }) =>
      GitHubRepositoriesModel(
        items: items ?? this.items,
      );
}

@HiveType(typeId: 2)

///
class Item {
  ///
  @HiveField(0)
  int id;

  ///
  @HiveField(1)
  String fullName;

  ///
  @HiveField(2)
  String htmlUrl;

  ///
  @HiveField(3)
  String? description;

  ///
  @HiveField(4)
  bool favorite;

  ///
  Item({
    required this.id,
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.favorite,
  });

  ///
  factory Item.empty() =>
      Item(id: 0, fullName: '', htmlUrl: '', description: '', favorite: false);

  ///
  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] as int,
        fullName: json["name"] as String,
        htmlUrl: json["html_url"] as String,
        description: json["description"] as String,
        favorite: false,
      );

  ///
  Item copyWith({
    int? id,
    String? fullName,
    String? htmlUrl,
    String? description,
  }) =>
      Item(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        description: description ?? this.description,
        favorite: favorite,
      );
}
