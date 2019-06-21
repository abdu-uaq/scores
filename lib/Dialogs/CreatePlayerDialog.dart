import 'package:flutter/material.dart';
import 'package:scores/Models/player.dart';
import 'package:scores/stores/PlayersStore.dart';

PlayersStore playersStore = getPlayersStoreInstance();

class CreatePlayerDialog extends StatefulWidget {
  @override
  _CreatePlayerDialogState createState() => new _CreatePlayerDialogState();
}

class _CreatePlayerDialogState extends State<CreatePlayerDialog> {
  String name = '';
  String _errorMessage = null;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter new player name'),
      content: new Row(
        children: <Widget>[
          new Expanded(
              child: new TextField(
            autofocus: true,
            decoration: new InputDecoration(
              labelText: 'Name',
              errorText: _errorMessage,
            ),
            onChanged: (value) {
              name = value;
            },
          ))
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(null);
          },
        ),
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Player existingPlayer = playersStore.items.firstWhere((var player) {
              return player.name == name;
            }, orElse: () => null);

            setState(() {
              if (existingPlayer != null) {
                _errorMessage = "Player with name \"$name\" already exists";
              } else if (name == "") {
                _errorMessage = "Player can not have an empty name";
              }
            });
            if (_errorMessage == null) {
              playersStore.addPlayer(Player(name));
              Navigator.of(context).pop(name);
            }
          },
        ),
      ],
    );
  }
}

Future<String> showCreatePlayerDialog(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return CreatePlayerDialog();
    },
  );
}
