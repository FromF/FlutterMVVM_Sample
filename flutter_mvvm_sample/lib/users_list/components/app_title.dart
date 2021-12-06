import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String text;
  const AppTitle({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }
}