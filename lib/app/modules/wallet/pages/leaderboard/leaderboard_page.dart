import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'leaderboard_controller.dart';

class LeaderboardPage extends StatefulWidget {
  final String title;
  const LeaderboardPage({Key key, this.title = "Leaderboard"})
      : super(key: key);

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState
    extends ModularState<LeaderboardPage, LeaderboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
