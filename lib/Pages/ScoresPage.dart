import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scores/stores/ScoresStore.dart';

ScoresStore scoresStore = getScoresStoreInstance();

class ScoresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: scoresStore.items.length,
        itemBuilder: (context, index) {
          return buildSlidable(index, context);
        },
      );
    });
  }

  Slidable buildSlidable(int index, BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            scoresStore.removeScore(index);
            Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text("Sending Message"),
            ));
          },
        ),
      ],
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${scoresStore.items[index].player1}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "${scoresStore.items[index].player1Score}",
              style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${scoresStore.items[index].player2}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "${scoresStore.items[index].player2Score}",
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
