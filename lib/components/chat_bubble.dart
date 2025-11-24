import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Alignment alignment;
  const ChatBubble({super.key, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(24),
        width: 200,
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
          // by default, Column will take up the space of its container
          // use this so that it takes up only the space necessary!
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: alignment == Alignment.centerLeft
                  ? TextAlign.start
                  : TextAlign.end,
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
