import 'package:flutter/material.dart';
import 'app_background.dart';
import '../config/size_config.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeHorizontal * 100,
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('設定',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Kosugi'
                      )
                    )
                  ],
                ),
              ),
              Container(
                height: SizeConfig.blockSizeVertical * 58,
                width: SizeConfig.blockSizeHorizontal * 100,
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _menuItem("通知設定", Icon(Icons.settings)),
                    _menuItem("アプリのレビュー", Icon(Icons.map)),
                    _menuItem("アプリをシェア", Icon(Icons.room)),
                    _menuItem("問い合わせ", Icon(Icons.local_shipping)),
                    _menuItem("利用規約", Icon(Icons.airplanemode_active)),
                    _menuItem("バージョン", Icon(Icons.airplanemode_active)),
                  ],
                ),
              ),
              // Container(
              //   height: SizeConfig.blockSizeVertical * 20,
              //   width: SizeConfig.blockSizeHorizontal * 100,
              //   color: Colors.green,
              // ),
              Container(
                height: SizeConfig.blockSizeVertical * 40,
                width: SizeConfig.blockSizeHorizontal * 100,
                color: Colors.red,
              ),
            ],
          ),
        )
      )
    );
  }

  Widget _menuItem (String title, Icon icon) {
    return GestureDetector(
      child:Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              // border: new Border(bottom: BorderSide(width: 1.0, color: Colors.black))
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child:icon,
              ),
              Text(
                title,
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 18.0
                ),
              ),
            ],
          )
      ),
      onTap: () {
        print("onTap calledaaaa.");
      },
    );
  }
}

