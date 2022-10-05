import 'package:flutter/material.dart';

class Another extends StatelessWidget {
  dynamic divided;
  Another({
    Key? key,
    this.divided,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Saved Wordpairs')),
        body: ListView(children: divided));
  }
}
