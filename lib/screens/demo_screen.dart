import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  Stream<int> yieldNumbers() async* {
    List<int> nums = [9, 4, 1, 3, 6];
    for (int number in nums) {
      // wait a little bit so things are not immediately avaiable
      await Future.delayed(const Duration(seconds: 2));
      yield number;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: StreamBuilder<int>(
          initialData: 0,
          stream: yieldNumbers(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text("The current value of i is ${snapshot.data}");
          },
        ),
      ),
    );
  }
}
