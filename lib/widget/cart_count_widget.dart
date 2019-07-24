import 'package:flutter/material.dart';
import 'package:flutter_jd/common/model/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/provide/cart_provide.dart';

class CartCountWidget extends StatelessWidget {
  final CartModel cartModel;
  CartCountWidget(this.cartModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color:Colors.grey[500],
        )
      ),
      child: Row(
        children: <Widget>[
          _countBtn(context,"-",(){
            Provide.value<CartProvide>(context).addOrReduceAction(cartModel, 'reduce');
            print('减');
          }),
          _countArea(context),
          _countBtn(context,"+",(){
            Provide.value<CartProvide>(context).addOrReduceAction(cartModel, 'add');
            print('加');
          }),
        ],
      ),
    );
  }

  // 减少按钮
  Widget _countBtn(BuildContext context,String title,VoidCallback callback){
    return InkWell(
      onTap: callback,
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (title=='-' && cartModel.count>1)?Colors.white:Colors.black12,
          border: Border(
            right: BorderSide(
              width: title=='-'?1:0,
              color: Colors.grey[500],
            ),
            left: BorderSide(
              width: title=='+'?1:0,
              color: Colors.grey[500],
            ),
          )
        ),
        child: Text(title),
      ),
    );
  }

  // 中间数量显示区域
  Widget _countArea(BuildContext context){
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(40),
      alignment: Alignment.center,
      color:Colors.white,
      child: Text('${cartModel.count}'),
    );
  }
}