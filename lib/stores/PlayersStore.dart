import 'package:mobx/mobx.dart';
import 'package:scores/Models/player.dart';

part 'PlayersStore.g.dart';

// This is the class used by rest of your codebase
class PlayersStore = _PlayersStore with _$PlayersStore;


// The store-class
abstract class _PlayersStore with Store {
  List<Player> items = ObservableList<Player>();

  @action
  void addPlayer(Player player) {
    items.add(player);
  }

  @action
  void removePlayer(int index) {
    items.removeAt(index);
  }
}

_PlayersStore _instance;


_PlayersStore getPlayersStoreInstance() {
  if (_instance == null) {
    _instance = new PlayersStore(); // Causes singleton instantiation
  }
  return _instance;
}