// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_hub_repositories_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GitHubRepositoriesModelAdapter
    extends TypeAdapter<GitHubRepositoriesModel> {
  @override
  final int typeId = 1;

  @override
  GitHubRepositoriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GitHubRepositoriesModel(
      items: (fields[0] as List).cast<Item>(),
    );
  }

  @override
  void write(BinaryWriter writer, GitHubRepositoriesModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitHubRepositoriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 2;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      id: fields[0] as int,
      fullName: fields[1] as String,
      htmlUrl: fields[2] as String,
      description: fields[3] as String?,
      favorite: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.htmlUrl)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
