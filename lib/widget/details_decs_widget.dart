import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/provide/details_provide.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsDecsWidget extends StatelessWidget {
  const DetailsDecsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsProvide>(
      builder: (context,child,data){
        var isLeft = Provide.value<DetailsProvide>(context).isLeft;
        if(isLeft){
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                ..._goodsDetail(context),
                Html(
                  data: "<img src='http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_1074.jpg' /><img src='http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_1074.jpg' />",
                )
              ],
            ),
          );
        }else{
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text('暂时没有数据',style: TextStyle(color: Colors.grey),),
          );
        }
      },
    );
  }

  List<Widget> _goodsDetail(BuildContext context){
    List<String> goodsDetails = Provide.value<DetailsProvide>(context).goodsInfo.data.goodInfo.goodsDetail;
    List<Widget> result = [];
    goodsDetails.map((item){
      result.add(Container(
        padding: EdgeInsets.all(5.0),
        child: Image.network(item,fit: BoxFit.cover,),
      ));
    }).toList();
    return result;
  }
}