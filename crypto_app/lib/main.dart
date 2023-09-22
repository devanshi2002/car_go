import 'package:agora_uikit/agora_uikit.dart';
import 'package:crypto_app/appId.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AgoraClient client = AgoraClient(
      agoraConnectionData:
          AgoraConnectionData(appId: appId, channelName: "test"),
      enabledPermission: [Permission.camera, Permission.microphone]);
  @override
  void initState() {
    super.initState();
    client.initialize();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Face Time "),
      ),
      body: Stack(
        children: [
          AgoraVideoViewer(client: client),
          AgoraVideoButtons(client: client),
        ],
      ),
    );
  }
}
