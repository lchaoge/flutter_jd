import 'package:flutter/material.dart';
import 'package:flutter_jd/provide/counter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> textList = [];

  @override
  void initState() {
    _show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车'),),
      body: Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(750),
              child: ListView.builder(
                itemCount: textList.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    title: Text(textList[index]),
                  );
                },
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){_add();},
                  child: Text('增加'),
                ),
                RaisedButton(
                  onPressed: (){_clear();},
                  child: Text('删除'),
                ),
                RaisedButton(
                  onPressed: (){_show();},
                  child: Text('查看'),
                ),
              ],
            )
          ],
        ),
      ),
    ),
    );
  }

  // 增加方法
  void _add() async{
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    String temp = 'jd商城';
    textList.add(temp);
    prefs.setStringList('jd', textList);
    _show();
  }
  _show() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getStringList('jd')!=null){
      setState(() {
        textList = prefs.getStringList('jd');
      });
    }
  }
  _clear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    prefs.remove('jd');
    setState(() {
      textList = [];
    });
  }
}
