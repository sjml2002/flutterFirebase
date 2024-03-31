import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DrawPage extends StatefulWidget {
  final String name;
  const DrawPage({Key? key, required this.name}) : super(key: key);

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  late final WebSocketChannel channel;
  late List users = [widget.name];

  @override
  void initState() {
    super.initState();
    //자신의 컴퓨터 ip주소로 해야함
    final uri = Uri.parse("ws://192.168.200.178:4343");
    channel = WebSocketChannel.connect(uri);
    channel.ready;
    channel.sink.add(widget.name); //websocketserver.emit
    channel.stream.listen( (dynamic srvname) => {
      print(srvname), //debug
      users.add(srvname), //debug
      setState(() => {
        users.add(srvname),
      }),
    });
    users.add(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawing Page"),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          )
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget> [
            Positioned(
              top: 0,
              left: 0,
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    )
                  ),
                  child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return Container(
                      height: 10,
                      padding: const EdgeInsets.fromLTRB(0,0,0,3),
                      child: Center(child: Text('${users[idx]}', style: const TextStyle(fontSize: 50))),
                    );
                  },
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
