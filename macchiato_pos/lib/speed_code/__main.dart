import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Toast Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "This is a toast message",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
            child: const Text('Show Toast'),
          ),
        ),
      ),
    );
  }
}
