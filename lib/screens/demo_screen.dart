import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              // fit: FlexFit.tight,
              child: Container(color: Colors.green),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(color: Colors.black),
            ),
            Container(height: 100, color: Colors.red),
          ],
        ),
      ),
    );
  }
}

/*
Flexible has a .loose property that allows it to take the minimum space needed
by default. Expanded on the other hand is basically Flexible with FlexFit.tight.
This means it wants to take up as much available space as possible.

.tight -> Fill up all the space.
.loose -> Fill up the minimum space possible.
*/
