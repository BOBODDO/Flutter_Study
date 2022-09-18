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
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('탭이 들어간 APP'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Future<DateTime?> selectedDate = showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2023),
                    builder: (context, child) => Theme(
                        data: ThemeData.dark(),
                        child: child!)); //null 오류를 해결하기 위하여 ! suffix 추가

                selectedDate.then((dateTime) {
                  setState(() {
                    _selectedTime = dateTime!;
                  });
                });
              },
              child: Text('날짜 선택기'),
            ),
            Text('$_selectedTime 이 선택되었습니다')
          ],
        ));
  }
}
