import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  const ErrorPage({
    Key? key,
    this.message = 'An error occurred',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}
