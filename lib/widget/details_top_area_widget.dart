import 'package:flutter/material.dart';
import 'package:flutter_jd/provide/details_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopAreaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsProvide>(
      builder: (context, child, data) {
        // var goodsInfo = data.goodsInfo.data.goodInfo;
        var goodsInfo =
            Provide.value<DetailsProvide>(context).goodsInfo.data.goodInfo;
        if (goodsInfo != null) {
          return Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _goodsImage(goodsInfo.image1),
                _goodsName(goodsInfo.goodsName),
                _goodsNum(goodsInfo.goodsSerialNumber),
                _goodsPrice(goodsInfo.oriPrice,goodsInfo.presentPrice),
              ],
            ),
          );
        } else {
          return Text('加载中');
        }
      },
    );
  }

  // 设置商品图片
  Widget _goodsImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: ScreenUtil().setWidth(740),
    );
  }

  // 商品名称
  Widget _goodsName(String name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        name,
        style: TextStyle(fontSize: ScreenUtil().setSp(30.0)),
      ),
    );
  }

  // 商品编号
  Widget _goodsNum(String num) {
    return Container(
      width: ScreenUtil().setWidth(740),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号：$num',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  // 价格
  Widget _goodsPrice(double oriPrice,double presentPrice){
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      width: ScreenUtil().setWidth(740),
      child: Row(
        children: <Widget>[
          Text('￥$presentPrice',style: TextStyle(
            color:Colors.pink
          ),),
          SizedBox(
            width: 10.0,
          ),
          Text('市场价：￥$oriPrice',style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey
          ),),
        ],
      ),
    );
  }


}
