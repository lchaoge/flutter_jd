import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/provide/details_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTabbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsProvide>(
      builder: (context,child,data){
        var isLeft = Provide.value<DetailsProvide>(context).isLeft;
        var isRight = Provide.value<DetailsProvide>(context).isRight;
        return Container(
          child: Row(
            children: <Widget>[
              _tabBarItem(context,isLeft,'left','详情'),
              _tabBarItem(context,isRight,'right','评论'),
            ],
          ),
        );
      },
      
    );
  }

  // 详情
  Widget _tabBarItem(BuildContext context,bool isClick,String sign,String title){
    return InkWell(
      onTap: (){
        Provide.value<DetailsProvide>(context).changeLeftAndRight(sign);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isClick?Colors.pink:Colors.grey
            )
          )
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isClick?Colors.pink:Colors.grey 
          ),
        ),
      ),
    );
  }

}