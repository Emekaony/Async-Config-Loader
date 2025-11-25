import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:simple_application/components/chat_bubble.dart';
import 'package:simple_application/components/chat_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi Nnaemeka",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log("I pressed the logout button");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                // in a real world scenario, chat bubble alignment will be based on userID
                final bubbleAlignment = index % 2 == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight;
                return ChatBubble(
                  alignment: bubbleAlignment,
                  message: "Hello emeka",
                );
              },
            ),
          ),
          ChatInputWidget(),
        ],
      ),
    );
  }
}
