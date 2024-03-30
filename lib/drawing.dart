import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DrawPage extends StatefulWidget {
  final String name;
  const DrawPage({Key? key, required this.name}) : super(key: key);

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  late final WebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    final uri = Uri.parse("ws://192.168.200.126:4343"); //자신의 컴퓨터 ip주소로 해야함
    channel = WebSocketChannel.connect(uri);
    channel.ready;
    channel.sink.add(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawing Page"),
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
            Container(
              color: Colors.black,
              width: 100,
              height: 30,
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : 'default');
              } 
            )
            // submit 버튼 만듭시다
          ],
        ),
      ),
    );
  }
}
