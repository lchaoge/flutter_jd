import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class JPushPage extends StatefulWidget {
  @override
  _JPushPageState createState() => _JPushPageState();
}

class _JPushPageState extends State<JPushPage> {

  String debugLable ='Unknown';
  final JPush jpush = new JPush();

  @override
  void initState() {
    
    super.initState();
  }

  Future<void> initPlatformState() async{
    String platformVersion;
    try {
      jpush.addEventHandler(
        onReceiveNotification:(Map<String,dynamic> message) async{
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>flutter接受到的推送:$message');
          setState(() {
            debugLable = '接受到推送:$message'; 
          });
        }
      );
    } on PlatformException {
      platformVersion = '平台版本获取失败，请检查。';
    }

    if(!mounted)return;

    setState(() {
     debugLable = platformVersion;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('极光推送'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('结果 ：$debugLable'),
            FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: (){
                var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch+3000);
                var localNotification = LocalNotification(
                  id: 123,
                  title: '朝歌推送',
                  buildId: 1,
                  content: '看到了内容就算成功了',
                  fireTime: fireDate,
                  subtitle: '一个测试'
                );
                jpush.sendLocalNotification(localNotification).then((res){
                  setState(() {
                    debugLable = res;
                  });
                });
              },
              child: Text('发送推送信息'),
            )
          ],
        ),
      ),
    );
  }
}