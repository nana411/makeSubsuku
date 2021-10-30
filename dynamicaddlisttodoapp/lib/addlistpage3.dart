import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddListpage2 extends StatefulWidget {
  final String title;
  final String service;
  final dynamic price;
  const AddListpage2({Key key, this.title, this.service, this.price}) : super(key: key);


  @override
  _AddListpageState createState() => _AddListpageState();
}

class _AddListpageState extends State<AddListpage2> {

  String _service = '';
  String _price = '';
  String _memo = '';
  String dropdownValue = '１か月';
  final formatter = NumberFormat("#,###");
//  final inputPrice = new TextEditingController();
  var _labelText = 'Select Date';
  // 選択した日時を格納する変数
  var _mydatetime = new DateTime.now();

  // 日時を指定したフォーマットで指定するためのフォーマッター
  var dateFormatter = new DateFormat('yyyy/MM/dd(E) HH:mm');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2020),
    );
    if (selected != null) {
      setState(() {
        _labelText = (DateFormat.yMMMd()).format(selected);
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
          child: Form(
            child: Container(
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
                          Center(
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Text('アイコン', style: titleStyle),
                                SizedBox(height: 5),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.add, color: Colors.white),
                                  radius: 30,
                                )

                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('サービス名', style: titleStyle),
                          TextFormField(
                              initialValue: widget.service,
                              cursorColor: Colors.black,
                              maxLength: 30,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              onChanged: (String value) {
                                setState(() {
                                  _service = value;
                                });
                              }
                          ),
                          SizedBox(height: 20),
                          Text('利用料金', style: titleStyle),
                          TextFormField(
                              initialValue: widget.price,
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
                                  _price = value;
                                });
                              }
                          ),
                          SizedBox(height: 20),
                          Text('初回支払日', style: titleStyle),
                          Row(
                            //    children: <Widget>[
                            //                  Text(
                            //                    _labelText,
                            //                    style: TextStyle(fontSize: 18),
                            //                  ),
                            //                  IconButton(
                            //                    icon: Icon(Icons.date_range),
                            //                    onPressed: () => _selectDate(context),
                            //                  )
                            //     ],
                            children: <Widget>[
                              Text(
                                'あなたが選択した日時は以下です: ',
                              ),
                              Text(
                                // フォーマッターを使用して指定したフォーマットで日時を表示
                                // format()に渡すのはDate型の値で、String型で返される
                                dateFormatter.format(_mydatetime),
                                style: Theme.of(context).textTheme.display1,
                              ),
                            ],

                          ),

                          SizedBox(height: 20),
                          Text('支払いスパン', style: titleStyle),
                          SizedBox(height: 10),
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
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
                          Text('期限（期間限定で契約したい場合などにお知らせします）'),
                          TextButton(
                            onPressed: null,
                            child: Text('お知らせする'),
                          ),
                          SizedBox(height: 20),
                          Text('リマインド'),
                          TextFormField(),
                          SizedBox(height: 20),
                          SizedBox(height: 20),
                          Text('メモ'),
                          TextFormField(
                            cursorColor: Colors.black,
                            maxLength: 300,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),

        )

    );
  }
}
