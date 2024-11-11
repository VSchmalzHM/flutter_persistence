import 'package:flutter/material.dart';
import 'package:flutter_persistence/file_storage.dart';
import 'package:flutter_persistence/file_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Persistence Demo"),
        ),

        body: Column(
          children: <Widget>[
            FileWidget(storage: FileStorage())
          ],
        ),
      ),
    );
  }
}
