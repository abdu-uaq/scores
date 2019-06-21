import 'package:mobx/mobx.dart';
import 'package:scores/Models/score.dart';

// Include generated file
part 'ScoresStore.g.dart';

// This is the class used by rest of your codebase
class ScoresStore = _ScoresStore with _$ScoresStore;


// The store-class
abstract class _ScoresStore with Store {
  List<Score> items = ObservableList<Score>();

  @action
  void addScore(Score score) {
    items.add(score);
  }

  @action
  void removeScore(index) {
    items.removeAt(index);
  }
}

_ScoresStore _instance;


_ScoresStore getScoresStoreInstance() {
  if (_instance == null) {
    _instance = new ScoresStore(); // Causes singleton instantiation
    _instance.addScore(new Score("aa", "aa", 2, 3));
  }
  return _instance;
}