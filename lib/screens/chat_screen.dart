import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:simple_application/components/chat_bubble.dart';
import 'package:simple_application/components/chat_input.dart';
import 'package:simple_application/models/author.dart';
import 'package:simple_application/models/chat_message_entity.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  final List<ChatMessageEntity> _mockmessages = [
    ChatMessageEntity(
      text: "Hello there!",
      id: "1",
      createdAt: 1000,
      author: Author(name: "Alice"),
      imageUrl: null,
    ),
    ChatMessageEntity(
      text: "How are you?",
      id: "2",
      createdAt: 2000,
      author: Author(name: "Bob"),
      imageUrl: null,
    ),
    ChatMessageEntity(
      text: "I'm doing great!",
      id: "3",
      createdAt: 3000,
      author: Author(name: "Charlie"),
      imageUrl: null,
    ),
    ChatMessageEntity(
      text: "Thanks for asking",
      id: "4",
      createdAt: 4000,
      author: Author(name: "Diana"),
      imageUrl: "assets/images/silver_ball.jpg",
    ),
    ChatMessageEntity(
      text: "What's new?",
      id: "5",
      createdAt: 5000,
      author: Author(name: "Eve"),
      imageUrl: "assets/images/silver_ball.jpg",
    ),
    ChatMessageEntity(
      text: "Just working on some stuff",
      id: "6",
      createdAt: 6000,
      author: Author(name: "Frank"),
      imageUrl: "assets/images/silver_ball.jpg",
    ),
    ChatMessageEntity(
      text: "That sounds interesting",
      id: "7",
      createdAt: 7000,
      author: Author(name: "Grace"),
      imageUrl: "assets/images/silver_ball.jpg",
    ),
    ChatMessageEntity(
      text: "Tell me more",
      id: "8",
      createdAt: 8000,
      author: Author(name: "Henry"),
      imageUrl: "assets/images/silver_ball.jpg",
    ),
    ChatMessageEntity(
      text: "Sure, let's chat",
      id: "9",
      createdAt: 9000,
      author: Author(name: "Iris"),
      imageUrl: "assets/images/silver_ball.jpg",
    ),
    ChatMessageEntity(
      text: "Looking forward to it",
      id: "10",
      createdAt: 10000,
      author: Author(name: "Jack"),
      imageUrl: "assets/images/silver_ball.jpg",
    ),
  ];

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hi Nnaemeka",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log("I pressed the logout button");
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget._mockmessages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Alignment buttonAlignment = index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight;
                  return ChatBubble(
                    entity: widget._mockmessages[index],
                    alignment: buttonAlignment,
                  );
                },
              ),
            ),
            // ignore this function for now
            ChatInputWidget(onSubmit: (_) {}),
          ],
        ),
      ),
    );
  }
}
