import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  final String name;
  const DrawPage({Key? key, required this.name}) : super(key: key);

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawing Page"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "이름\n",
            ),
            Text(
              widget.name,
            ),
            // submit 버튼 만듭시다
          ],
        ),
      ),
    );
  }
}
