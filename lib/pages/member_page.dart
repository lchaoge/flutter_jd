import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(),
          _orderTitle(),
          _orderType(),
        ],
      )
    );
  }

  Widget _topHeader(){
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: Color.fromRGBO(228, 49, 48, 1.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: ClipOval(
              child: Image.network('http://storage.360buyimg.com/i.imageUpload/6a645f3433313063386533363933346231343733363531343134323131_mid.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('朝歌',style: TextStyle(
              fontSize: ScreenUtil().setSp(36),
              color: Colors.black45,
            ),),
          )
        ],
      ),
    );
  }

  // 我的订单
  Widget _orderTitle(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom:BorderSide(
            width: 1,
            color:Colors.black12
          )
        )
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_back_ios),
      ),
    );
  }

  Widget _orderType(){
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.query_builder,size: 30,),
                  Text('代付款')
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.queue_music,size: 30,),
                  Text('代发货')
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.card_giftcard,size: 30,),
                  Text('待收货')
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Icon(Icons.query_builder,size: 30,),
                  Text('待评价')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}