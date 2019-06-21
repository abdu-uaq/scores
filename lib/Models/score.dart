import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'score.g.dart';

@JsonSerializable()
class Score {
  String id = new Uuid().v4();
  String player1;
  String player2;
  int player1Score;
  int player2Score;

  Score(this.player1, this.player2, this.player1Score, this.player2Score);
}
