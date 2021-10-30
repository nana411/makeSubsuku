import 'package:flutter/material.dart';

class AddListpage extends StatefulWidget {
  const AddListpage({Key key}) : super(key: key);

  @override
  _AddListpageState createState() => _AddListpageState();
}

class _AddListpageState extends State<AddListpage> {

  String _text = '';

  // TextEditingController _controller;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TextEditingController();
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
              }),
            const SizedBox(height:8),

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
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: TextField(
  //         controller: _controller,
  //         onSubmitted: (String value) async {
  //           await showDialog<void>(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return AlertDialog(
  //                 title: const Text('Thanks!'),
  //                 content: Text(
  //                     'You typed "$value", which has length ${value.characters.length}.'),
  //                 actions: <Widget>[
  //                   TextButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     child: const Text('OK'),
  //                   ),
  //                 ],
  //               );
  //             },
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}
