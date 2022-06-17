import 'package:flutter/material.dart';

class NotificationTabScreen extends StatefulWidget {
  const NotificationTabScreen({Key? key}) : super(key: key);

  @override
  State<NotificationTabScreen> createState() => _NotificationTabScreenState();
}

class _NotificationTabScreenState extends State<NotificationTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("notification"),
      ),
    );
  }
}
