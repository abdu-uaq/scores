// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Score _$ScoreFromJson(Map<String, dynamic> json) {
  return Score(json['player1'] as String, json['player2'] as String,
      json['player1Score'] as int, json['player2Score'] as int)
    ..id = json['id'] as String;
}

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'id': instance.id,
      'player1': instance.player1,
      'player2': instance.player2,
      'player1Score': instance.player1Score,
      'player2Score': instance.player2Score
    };
