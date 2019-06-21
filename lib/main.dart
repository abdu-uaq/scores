import 'package:flutter/material.dart';
import 'package:scores/Pages/MachPage.dart';
import 'package:scores/stores/ScoresStore.dart';

import 'Dialogs/CreatePlayerDialog.dart';
import 'Pages/PayersPage.dart';
import 'Pages/ScoresPage.dart';

ScoresStore scores = getScoresStoreInstance(); // Instantiate the store

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  PlayersPage playersPage = PlayersPage();
  MatchPage matchPage = MatchPage();
  ScoresPage scoresPage = ScoresPage();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      playersPage,
      matchPage,
      scoresPage,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Score app'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: new Visibility(
        child: new Builder(builder: (BuildContext context) {
          return new FloatingActionButton(
            onPressed: () async {
              String name = await showCreatePlayerDialog(context);
              if (name == null) {
                return;
              }
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Created player $name"),
              ));
            },
            child: Icon(Icons.add),
          );
        }),
        visible: _selectedIndex == 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            title: Text('Players'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            title: Text('Match'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Scores'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}