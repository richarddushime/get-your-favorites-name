import 'package:flutter/material.dart';

class Another extends StatelessWidget {
  final Iterable<ListTile> tiles = _savedWordpairs.map((WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)),
    );
  });
  final List<Widget> divided =
      ListTile.divideTiles(context: context, tiles: tiles).toList();

  const Another({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Saved Wordpairs')),
        body: ListView(children: divided));
  }
}
