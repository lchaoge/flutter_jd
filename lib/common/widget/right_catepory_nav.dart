import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_jd/common/model/category_model.dart';
import 'package:flutter_jd/common/provide/child_category_provide.dart';
import 'package:provide/provide.dart';

class RightCateporyNav extends StatefulWidget {
  @override
  _RightCateporyNavState createState() => _RightCateporyNavState();
}

class _RightCateporyNavState extends State<RightCateporyNav> {

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategoryProvide>(
      builder: (context,child,childCategory){
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
          ),
          height: ScreenUtil().setHeight(80.0),
          width: ScreenUtil().setWidth(550.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return _rightInkWell(index,childCategory.childCategoryList[index]);
            },
          ),
        );
      },
    );
  }

  Widget _rightInkWell(int index,BxMallSubDto item) {
    bool isClick = false;
    isClick = (index==Provide.value<ChildCategoryProvide>(context).childIndex)?true:false;
    return InkWell(
      onTap: () {
        print(item);
        Provide.value<ChildCategoryProvide>(context).changeChildIndex(index);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          '${item.mallSubName}',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28.0),
            color: isClick?Colors.pink:Colors.black
          ),
        ),
      ),
    );
  }
}
