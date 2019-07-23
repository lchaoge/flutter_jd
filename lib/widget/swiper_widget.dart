import 'package:flutter/material.dart';
import 'package:flutter_jd/routes/router_static.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 首页轮播组件
 */
class SwiperWidget extends StatelessWidget {

  final List swiperDataList;
  SwiperWidget({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: ScreenUtil().setHeight(264),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: (){
              RouterStatic.router.navigateTo(context, '/detail?id="23213"');
            },
            child: Image.network(swiperDataList[index],fit: BoxFit.cover,),
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
