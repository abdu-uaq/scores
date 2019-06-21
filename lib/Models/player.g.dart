// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(json['name'] as String)..id = json['id'] as String;
}

Map<String, dynamic> _$PlayerToJson(Player instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
