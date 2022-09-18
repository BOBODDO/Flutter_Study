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
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _lists_source = [
      '방울복랑금',
      '다육이',
      '야생화',
      '분재',
      '화분',
      '방울복랑금',
      '다육이',
      '야생화',
      '분재',
      '화분',
      '방울복랑금',
      '다육이',
      '야생화',
      '분재',
      '화분',
      '방울복랑금',
      '다육이',
      '야생화',
      '분재',
      '화분'
    ];
    var lists_tiled =
        _lists_source.map((i) => ListTile(title: Text(i))).toList();
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              '엑스플랜트',
              style: TextStyle(color: Colors.white),
            ),
            background:
                Image.network('https://m.xplant.co.kr/img/xplant_app_logo.png'),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(lists_tiled))
      ]),
    );
  }
}
