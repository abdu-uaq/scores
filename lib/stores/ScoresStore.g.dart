// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ScoresStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$ScoresStore on _ScoresStore, Store {
  final _$_ScoresStoreActionController = ActionController(name: '_ScoresStore');

  @override
  void addScore(Score score) {
    final _$actionInfo = _$_ScoresStoreActionController.startAction();
    try {
      return super.addScore(score);
    } finally {
      _$_ScoresStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeScore(dynamic index) {
    final _$actionInfo = _$_ScoresStoreActionController.startAction();
    try {
      return super.removeScore(index);
    } finally {
      _$_ScoresStoreActionController.endAction(_$actionInfo);
    }
  }
}
