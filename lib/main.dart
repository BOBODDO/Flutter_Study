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
  String _selectedTime = '';

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
                Future<TimeOfDay?> selectedDate = showTimePicker(
                    context: context, initialTime: TimeOfDay.now());

                selectedDate.then((timeOfDay) {
                  setState(() {
                    _selectedTime = '${timeOfDay!.hour} : ${timeOfDay!.minute}';
                  });
                });
              },
              child: Text('시간 선택기'),
            ),
            Text('$_selectedTime 이 선택되었습니다')
          ],
        ));
  }
}
