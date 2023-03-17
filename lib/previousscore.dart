import 'package:flutter/material.dart';

class Prevscore extends StatefulWidget {
  var score = 0;
  List totoalscorelist;
  Prevscore({Key key, this.score, this.totoalscorelist}) : super(key: key);

  @override
  State<Prevscore> createState() => _PrevscoreState();
}

class _PrevscoreState extends State<Prevscore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Records")),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red),
              title: Text(widget.score.toString()),
            );
          }),
    );
  }
}
