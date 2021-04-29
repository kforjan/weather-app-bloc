import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.cloud),
            SizedBox(
              width: 10,
            ),
            Text('CurrentWather'),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("How's the weather?"),
          )
        ],
      ),
    );
  }
}
