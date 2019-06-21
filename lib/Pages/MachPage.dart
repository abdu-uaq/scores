import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scores/Models/player.dart';
import 'package:scores/Models/score.dart';
import 'package:scores/stores/MatchPageStore.dart';
import 'package:scores/stores/PlayersStore.dart';
import 'package:scores/stores/ScoresStore.dart';

MatchPageStore matchPageStore = getMatchPageStoreInstance();
PlayersStore playersStore = getPlayersStoreInstance();
ScoresStore scoresStore = getScoresStoreInstance();

class MatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: buildMainWidget(context),
      );
    });
  }

  Widget buildMainWidget(BuildContext context) {
    return new Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: buildPlayerDropDown(
                matchPageStore.playerOneName,
                matchPageStore.setPlayerOneName,
              ),
            ),
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration(
                  labelText: 'Player One Score',
                ),
                controller: matchPageStore.playerOneScore,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  matchPageStore.isDataValid();
                  matchPageStore.setPlayerOneScore(
                      int.tryParse(value) == null ? null : value);
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: buildPlayerDropDown(
                  matchPageStore.playerTwoName,
                  matchPageStore.setPlayerTwoName,
                ),
              ),
              Flexible(
                child: new TextField(
                  decoration: new InputDecoration(
                    labelText: 'Player Two Score',
                  ),
                  controller: matchPageStore.playerTwoScore,
                  onChanged: (value) {
                    matchPageStore.setPlayerTwoScore(
                        int.tryParse(value) == null ? null : value);
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: new RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              if (!matchPageStore.isDataValid()) {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("All the fields are required"),
                ));
              }
              scoresStore.addScore(new Score(
                matchPageStore.playerTwoName,
                matchPageStore.playerTwoName,
                int.tryParse(matchPageStore.playerOneScore.text),
                int.tryParse(matchPageStore.playerTwoScore.text),
              ));
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Created Score"),
              ));
              matchPageStore.clearScores();
              matchPageStore.setPlayerOneName(null);
              matchPageStore.setPlayerTwoName(null);
            },
          ),
        )
      ],
    );
  }

  DropdownButton<String> buildPlayerDropDown(
      String dropdownValue, void setName(String name)) {
    return DropdownButton<String>(
      value: dropdownValue,
      hint: new Visibility(
        child: new Text("Select Player"),
        visible: dropdownValue == null,
      ),
      onChanged: (String name) {
        setName(name);
      },
      items: playersStore.items.map<DropdownMenuItem<String>>((Player player) {
        return DropdownMenuItem<String>(
          value: player.name,
          child: Text(player.name),
        );
      }).toList(),
    );
  }
}
