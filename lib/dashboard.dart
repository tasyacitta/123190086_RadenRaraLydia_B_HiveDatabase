import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Song List"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("Bisa Login"
              ) ,
            ],
          ),
        ),
      ),
    );
  }
}
