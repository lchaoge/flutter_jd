import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/provide/details_provide.dart';
import 'package:flutter_jd/widget/details_top_area_widget.dart';
import 'package:flutter_jd/widget/details_explain_widget.dart';
import 'package:flutter_jd/widget/details_tabbar_widget.dart';
import 'package:flutter_jd/widget/details_decs_widget.dart';
import 'package:flutter_jd/widget/details_bottom_widget.dart';

class DetailsPage extends StatelessWidget {

  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getBackInfo(context),
      builder: (context,snapshot){
        String name = Provide.value<DetailsProvide>(context).goodsInfo.data.goodInfo.goodsName;
        return Container(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon:Icon(Icons.arrow_back,),
                onPressed:(){
                  Navigator.pop(context);
                }
              ),
              title: Text(name),
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  child: ListView(
                    children: <Widget>[
                      DetailsTopAreaWidget(),
                      DetailsExplainWidget(),
                      DetailsTabbarWidget(),
                      DetailsDecsWidget(),
                      SizedBox(height: ScreenUtil().setHeight(80),)
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(80),
                  child: DetailsBottomWidget(),
                ),
              ],
            )
          )
        );
      }
    );
  }

  Future _getBackInfo(BuildContext context) async{
    await Provide.value<DetailsProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}