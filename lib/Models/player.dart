import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'player.g.dart';

@JsonSerializable()
class Player{
  String id = new Uuid().v4();
  String name;

  Player(this.name);
}