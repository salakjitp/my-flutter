import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: Container(
          child: Column(
        children: [
          Text("Count: ${_count}"),
          IconButton(onPressed: _handleClickAdd, icon: const Icon(Icons.add)),
          IconButton(
              onPressed: _handleClickMinus, icon: const Icon(Icons.remove))
        ],
      )),
    );
  }

  void _handleClickAdd() {
    setState(() {
      _count++;
    });
  }

  void _handleClickMinus() {
    setState(() {
      _count--;
    });
  }
}
