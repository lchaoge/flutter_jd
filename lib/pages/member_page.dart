import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_jd/routes/router_static.dart';

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
          _topHeader(context),
          _orderTitle(),
          _orderType(),
          _actionList(),
        ],
      )
    );
  }

  Widget _topHeader(BuildContext context){
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
            child: InkWell(
              onTap: (){
                print('极光推送开始');
                RouterStatic.router.navigateTo(context, '/jpush');
              },
              child: Text(
                '朝歌-极光推送点这里',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
                  color: Colors.black45,
                ),
              ),
            )
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
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderType(){
    return Container(
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

  // 通用调listtile
  Widget _myListTile(String  title){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _actionList(){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _myListTile('领取优惠券'),
          _myListTile('已领取优惠券'),
          _myListTile('地址管理'),
          _myListTile('客服管理'),
          _myListTile('关于我们'),
        ],
      ),
    );
  }

}