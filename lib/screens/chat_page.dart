import 'dart:developer';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
      body: Container(
        padding: EdgeInsets.all(24),
        width: 300,
        margin: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          // by default, COlumn will take up the space of its container
          // use this so that it takes up only the space necessary!
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.end,
              "Hi, this is Nnaemeka",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset("assets/images/silver_ball.jpg"),
          ],
        ),
      ),
    );
  }
}
