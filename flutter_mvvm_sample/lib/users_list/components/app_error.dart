import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? errorText;
  const AppError({this.errorText});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Visibility(
        visible: null != errorText && (errorText ?? '').isNotEmpty,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            errorText ?? '',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}