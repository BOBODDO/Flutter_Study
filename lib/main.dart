import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '플러터 실습',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _random_size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('중앙의 사진을 터치하면 크기가 변해요'),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              final random = Random();
              setState(() {
                _random_size = random.nextInt(200).toDouble() + 100;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: _random_size,
              height: _random_size,
              child: Image.asset('assets/banner.jpeg'),
              curve: Curves.fastOutSlowIn,
            )),
      ),
    );
  }
}
