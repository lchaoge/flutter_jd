import 'package:flutter/material.dart';
import 'package:flutter_jd/common/model/details_model.dart';
import 'package:flutter_jd/provide/details_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
                _goodsImage(goodsInfo),
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
  Widget _goodsImage(GoodInfo goodsInfo) {
    List<String> images = [];
    if(goodsInfo.image1.isNotEmpty){
      images.add(goodsInfo.image1);
    }
    if(goodsInfo.image2.isNotEmpty){
      images.add(goodsInfo.image2);
    }
    if(goodsInfo.image3.isNotEmpty){
      images.add(goodsInfo.image3);
    }
    if(goodsInfo.image4.isNotEmpty){
      images.add(goodsInfo.image4);
    }
    if(goodsInfo.image5.isNotEmpty){
      images.add(goodsInfo.image5);
    }
    
    return Container(
      height: ScreenUtil().setHeight(750),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: (){
            },
            child: FadeInImage.assetNetwork(
              image: images[index],
              fit: BoxFit.cover,
              placeholder: 'assets/images/jd_loading.png',
            ),
          );
        },
        itemCount: images.length,
        pagination: SwiperPagination(),
        autoplay: images.length>1?true:false,
      ),
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
