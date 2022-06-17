import 'package:flutter/material.dart';

class ChatTabScreen extends StatefulWidget {
  const ChatTabScreen({Key? key}) : super(key: key);

  @override
  State<ChatTabScreen> createState() => _ChatTabScreenState();
}

class _ChatTabScreenState extends State<ChatTabScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Chat"),
      ),
    );
  }
}
