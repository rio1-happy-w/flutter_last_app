import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    buildContainer('Container 1', Colors.amber),
                    buildContainer('Container 2', Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    buildContainer('Container 1', Colors.blue),
                    buildContainer('Container 2', Colors.amber),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String label, Color color) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Text(
        label,
      ),
    );
  }
}
