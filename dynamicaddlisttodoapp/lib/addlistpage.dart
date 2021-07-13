import 'package:flutter/material.dart';

class AddListpage extends StatefulWidget {
  const AddListpage({Key key}) : super(key: key);

  @override
  _AddListpageState createState() => _AddListpageState();
}

class _AddListpageState extends State<AddListpage> {

  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(_text, style: TextStyle(color: Colors.teal)),
            TextField(
              onChanged: (String value){
                setState(() {
                  _text = value;
                });
              },
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
