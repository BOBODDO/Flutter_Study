import 'package:flutter/material.dart';

final items = List.generate(100, (i) => i).toList();
var isChecked = false;
final _valueList = ['몬스테라', '다육이', '분재화분'];
var _selectedValue = '몬스테라';

enum Gender { MAN, WOMAN }

Gender _gender = Gender.MAN;

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
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('탭이 들어간 APP'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.info), text: '메뉴1'),
                Tab(icon: Icon(Icons.coffee), text: '메뉴2'),
                Tab(icon: Icon(Icons.breakfast_dining), text: '메뉴3')
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        child: Icon(Icons.person),
                      )),
                  Expanded(flex: 1, child: Image.asset('assets/banner.jpeg')),
                  CircularProgressIndicator()
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(18.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: '아이디를 입력하세요',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(18.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: '비밀번호를 입력하세요'),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Switch(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  RadioListTile(
                    title: Text('남자에요'),
                    value: Gender.MAN,
                    groupValue: _gender,
                    onChanged: (value) => setState(() {
                      _gender = value ?? Gender.MAN;
                    }),
                  ),
                  RadioListTile(
                    title: Text('여자에요'),
                    value: Gender.WOMAN,
                    groupValue: _gender,
                    onChanged: (value) => setState(() {
                      _gender = value ?? Gender.WOMAN;
                    }),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  DropdownButton(
                      items: _valueList
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) => setState(() {
                            _selectedValue = value ?? '몬스테라';
                          }),
                      value: _selectedValue)
                ],
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.coffee), label: 'coffee'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.smoke_free), label: 'smoke_free'),
            ],
          ),
        ));
  }
}
