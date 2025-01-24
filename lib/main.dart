import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text("初めてのコンテナー"),
              color: Colors.green,
              width: 100,
              height: 100,
            ),
            Container(
              child: Text("初めてのコンテナー"),
              color: Colors.yellow,
              width: 500,
              height: 100,
            ),
            SizedBox(
              width: 40.0,
              height: 0,
            ),
            Container(
              child: Text("初めてのコンテナー"),
              color: Colors.red,
              width: 100,
              height: 100,
            )
          ],
        )),
      ),
    );
  }
}
