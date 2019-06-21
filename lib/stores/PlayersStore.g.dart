// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlayersStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$PlayersStore on _PlayersStore, Store {
  final _$_PlayersStoreActionController =
      ActionController(name: '_PlayersStore');

  @override
  void addPlayer(Player player) {
    final _$actionInfo = _$_PlayersStoreActionController.startAction();
    try {
      return super.addPlayer(player);
    } finally {
      _$_PlayersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePlayer(int index) {
    final _$actionInfo = _$_PlayersStoreActionController.startAction();
    try {
      return super.removePlayer(index);
    } finally {
      _$_PlayersStoreActionController.endAction(_$actionInfo);
    }
  }
}
