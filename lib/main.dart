import 'package:flutter/material.dart';
import './drawing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RealTime Drawing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'RealTime Drawing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();

  void gotoDrawPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DrawPage(name: nameController.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Text(
                '이름을 입력하세요.',
              ),
            ),
            Container(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "이름을 입력하시오.",
                ),
                controller: nameController,
              ),
            ),
            Container(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: gotoDrawPage,
              child: const SizedBox(
                  width: 200.0,
                  height: 300.0,
                  child: Text(
                    "로그인하기",
                  )),
            ))
            // submit 버튼 만듭시다
          ],
        ),
      ),
    );
  }
}
