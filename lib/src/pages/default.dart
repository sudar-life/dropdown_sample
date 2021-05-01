import 'package:flutter/material.dart';

class Default extends StatelessWidget {
  const Default({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[400],
      child: Center(
        child: Text("기본화면"),
      ),
    );
  }
}
