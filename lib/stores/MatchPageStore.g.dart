// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MatchPageStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$MatchPageStore on _MatchPageStore, Store {
  final _$playerOneNameAtom = Atom(name: '_MatchPageStore.playerOneName');

  @override
  String get playerOneName {
    _$playerOneNameAtom.reportObserved();
    return super.playerOneName;
  }

  @override
  set playerOneName(String value) {
    _$playerOneNameAtom.context
        .checkIfStateModificationsAreAllowed(_$playerOneNameAtom);
    super.playerOneName = value;
    _$playerOneNameAtom.reportChanged();
  }

  final _$playerTwoNameAtom = Atom(name: '_MatchPageStore.playerTwoName');

  @override
  String get playerTwoName {
    _$playerTwoNameAtom.reportObserved();
    return super.playerTwoName;
  }

  @override
  set playerTwoName(String value) {
    _$playerTwoNameAtom.context
        .checkIfStateModificationsAreAllowed(_$playerTwoNameAtom);
    super.playerTwoName = value;
    _$playerTwoNameAtom.reportChanged();
  }

  final _$playerOneScoreAtom = Atom(name: '_MatchPageStore.playerOneScore');

  @override
  TextEditingController get playerOneScore {
    _$playerOneScoreAtom.reportObserved();
    return super.playerOneScore;
  }

  @override
  set playerOneScore(TextEditingController value) {
    _$playerOneScoreAtom.context
        .checkIfStateModificationsAreAllowed(_$playerOneScoreAtom);
    super.playerOneScore = value;
    _$playerOneScoreAtom.reportChanged();
  }

  final _$playerTwoScoreAtom = Atom(name: '_MatchPageStore.playerTwoScore');

  @override
  TextEditingController get playerTwoScore {
    _$playerTwoScoreAtom.reportObserved();
    return super.playerTwoScore;
  }

  @override
  set playerTwoScore(TextEditingController value) {
    _$playerTwoScoreAtom.context
        .checkIfStateModificationsAreAllowed(_$playerTwoScoreAtom);
    super.playerTwoScore = value;
    _$playerTwoScoreAtom.reportChanged();
  }

  final _$_MatchPageStoreActionController =
      ActionController(name: '_MatchPageStore');

  @override
  dynamic setPlayerOneName(String name) {
    final _$actionInfo = _$_MatchPageStoreActionController.startAction();
    try {
      return super.setPlayerOneName(name);
    } finally {
      _$_MatchPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlayerTwoName(String name) {
    final _$actionInfo = _$_MatchPageStoreActionController.startAction();
    try {
      return super.setPlayerTwoName(name);
    } finally {
      _$_MatchPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlayerOneScore(String score) {
    final _$actionInfo = _$_MatchPageStoreActionController.startAction();
    try {
      return super.setPlayerOneScore(score);
    } finally {
      _$_MatchPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlayerTwoScore(String score) {
    final _$actionInfo = _$_MatchPageStoreActionController.startAction();
    try {
      return super.setPlayerTwoScore(score);
    } finally {
      _$_MatchPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearScores() {
    final _$actionInfo = _$_MatchPageStoreActionController.startAction();
    try {
      return super.clearScores();
    } finally {
      _$_MatchPageStoreActionController.endAction(_$actionInfo);
    }
  }
}
