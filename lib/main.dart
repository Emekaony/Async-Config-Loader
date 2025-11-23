import 'package:flutter/material.dart';
import 'package:simple_application/screens/chat_page.dart';
// import 'package:simple_application/screens/login_screen.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ChatPage());
  }
}
