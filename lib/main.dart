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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('이벤트 위젯을 통해 감싼 예제'),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                print('GesturdDetector 클릭!');
              },
              child: Text('클릭해보세요'),
            ),
            SizedBox(height: 200),
            InkWell(
              onTap: () {
                print('물결치는 InkWell 클릭');
              },
              child: Text('물결치는 클릭!'),
            )
          ],
        ));
  }
}
