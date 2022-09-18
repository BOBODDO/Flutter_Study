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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _lists_source = ['방울복랑금', '다육이', '해외구매', '치킨이 와서', '이제 곧 먹어야 해요'];
    var lists_tiled =
        _lists_source.map((i) => ListTile(title: Text(i))).toList();
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('엑스플랜트'),
            background: Image.network(
                'https://webp2.xplant.co.kr/data/item/16507/1650709424_l1.jpg'),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(lists_tiled))
      ]),
    );
  }
}
