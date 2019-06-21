import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scores/stores/PlayersStore.dart';

PlayersStore playersStore = getPlayersStoreInstance();

class PlayersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: playersStore.items.length,
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
                playersStore.removePlayer(index);
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("Player removed"),
                ));
              },
            ),
          ],
          dismissal: SlidableDismissal(
            child: SlidableDrawerDismissal(),
          ),
          child: ListTile(
            title: Text(playersStore.items[index].name),
          ),
        );
  }
}
