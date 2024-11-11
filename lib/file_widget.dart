import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_persistence/file_storage.dart';

class FileWidget extends StatefulWidget {
  final FileStorage storage;

  const FileWidget({super.key, required this.storage});
  
  @override
  State<StatefulWidget> createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  final TextEditingController _controller = TextEditingController();

  String _data = "";

  void _load() {
    widget.storage.readFile().then((value) {
      setState(() {
        _data = value;
        _controller.text = value;
      });
    });
  }

  Future<File> _save() {
    _data = _controller.text;
    return widget.storage.writeFile(_data);
  }

  @override
  void initState() {
    super.initState();
    widget.storage.readFile().then((value) {
      setState(() { _data = value; });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          const Text("File demo:"),
          SizedBox(
            height: 100,
            child: TextField(
              expands: true,
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
          Row(
            children: <Widget>[
              OutlinedButton(onPressed: _load, child: const Text("Load")),
              const Spacer(),
              OutlinedButton(onPressed: _save, child: const Text("Save"))
            ],
          )
        ],
      )
    );
  }
}
