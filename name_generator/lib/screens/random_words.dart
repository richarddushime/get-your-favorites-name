// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:name_generator/screens/another.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordsPairs = <WordPair>[];
  final _savedWordpairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();

          final index = item ~/ 2;
          if (index >= _randomWordsPairs.length) {
            _randomWordsPairs.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_randomWordsPairs[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordpairs.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWordpairs.remove(pair);
          } else {
            _savedWordpairs.add(pair);
          }
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get your Favorites'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  final Iterable<ListTile> tiles =
                      _savedWordpairs.map((WordPair pair) {
                    return ListTile(
                      title: Text(pair.asPascalCase,
                          style: TextStyle(fontSize: 16.0)),
                    );
                  });
                  final List<Widget> divided =
                      ListTile.divideTiles(context: context, tiles: tiles)
                          .toList();

                  return Another(divided: divided);
                }));
              })
        ],
      ),
      body: _buildList(),
    );
  }
}
