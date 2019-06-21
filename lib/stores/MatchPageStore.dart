import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'MatchPageStore.g.dart';

// This is the class used by rest of your codebase
class MatchPageStore = _MatchPageStore with _$MatchPageStore;

// The store-class
abstract class _MatchPageStore with Store {
  @observable
  String playerOneName;

  @observable
  String playerTwoName;

  @observable
  TextEditingController playerOneScore = new TextEditingController();

  @observable
  TextEditingController playerTwoScore = new TextEditingController();

  @action
  setPlayerOneName(String name) {
    playerOneName = name;
  }

  @action
  setPlayerTwoName(String name) {
    playerTwoName = name;
  }

  @action
  setPlayerOneScore(String score) {
    playerOneScore.text = score;
  }

  @action
  setPlayerTwoScore(String score) {
    playerTwoScore.text = score;
  }

  @action
  clearScores() {
    playerOneScore.text = "";
    playerTwoScore.text = "";
  }

  @computed
  bool isDataValid() {
    return playerOneScore.text != "" &&
        playerTwoScore.text != "" &&
        playerOneName != null &&
        playerTwoName != null;
  }
}

_MatchPageStore _instance;

_MatchPageStore getMatchPageStoreInstance() {
  if (_instance == null) {
    _instance = new MatchPageStore(); // Causes singleton instantiation
  }
  return _instance;
}
