import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class AddListpage2 extends StatefulWidget {
  final String title;
  final String serviceName;
  final dynamic serviceFee;
  final DateTime nextPayDate;
  final String dropdownValue;
  final String memo;
  const AddListpage2({Key key, this.title, this.serviceName, this.serviceFee,
  this.nextPayDate, this.dropdownValue, this.memo}) : super(key: key);

  @override
  _AddListpageState createState() => _AddListpageState();
}

class _AddListpageState extends State<AddListpage2> {

  String _serviceName = '';                     // サービス名
  String _serviceFee = '';                      // 利用料金
  DateTime _nextPayDate = DateTime.now();       // 次回支払日
  String _dropdownValue = '１か月';              // 支払いスパン
  String _memo = '';                            // メモ

  final formatter = NumberFormat("#,###");
  var dateFormatter = new DateFormat('yyyy/MM/dd(E)', "ja_JP");

  // カレンダー実装
  Future<void> _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      locale: const Locale("ja"),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    if (selected != null) {
      setState(() {
        _nextPayDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextTheme = Theme.of(context).textTheme;
    final titleStyle = defaultTextTheme.subtitle1.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text('サービス名', style: titleStyle),
                            TextFormField(
                                initialValue: widget.serviceName,
                                cursorColor: Colors.black,
                                maxLength: 30,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                onChanged: (String value) {
                                  setState(() {
                                    _serviceName = value;
                                  });
                                }
                            ),
                            SizedBox(height: 20),
                            Text('利用料金', style: titleStyle),
                            TextFormField(
                                initialValue: widget.serviceFee,
                                cursorColor: Colors.black,
                                maxLength: 30,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: [FilteringTextInputFormatter.deny(new RegExp('[\\-|\\ ]'))],
                                //      controller: inputPrice,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                onChanged: (String value) {
                                  setState(() {
                                    //            inputPrice.text = formatter.format(int.parse(value));
                                    _serviceFee = value;
                                  });
                                }
                            ),
                            SizedBox(height: 20),
                            Text('次回支払日', style: titleStyle),
                            SizedBox(height: 20),
                            Container(
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.date_range),
                                    onPressed: () => _selectDate(context),
                                  ),
                                  Text(
                                    //TextEditingController(text),
                                    //value: widget.nextPayDate,
                                    dateFormatter.format(_nextPayDate),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('支払いスパン', style: titleStyle),
                            SizedBox(height: 10),
                            DropdownButton<String>(
                              value: _dropdownValue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              underline: Container(
                                height: 1,
                                color: Colors.grey[600],
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _dropdownValue = value;
                                });
                              },
                              items: <String>['１か月', '３か月', '１年'
                              ]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              })
                                  .toList(),
                            ),
                            SizedBox(height: 20),
                            Text('メモ', style: titleStyle),
                            TextFormField(
                                cursorColor: Colors.black,
                                maxLength: 300,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                onChanged: (String value) {
                                  setState(() {
                                    _memo = value;
                                  });
                                }
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(_serviceName
                                              //_serviceFee,
                                              //_nextPayDate,
                                              //_dropdownValue,
                                              //_memo
                    );
                  },
                  child: Text('登録', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        )
    );
  }
}


