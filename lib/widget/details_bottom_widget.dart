import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          _shopCart(),
          _btnCart('加入购物车',Colors.green,(){
            print('加入购物车');
          }),
          _btnCart('立即购买',Colors.red,(){
            print('立即购买');
          }),
        ],
      )
    );
  }

  Widget _shopCart(){
    return InkWell(
      onTap: (){
        print('点击购物车');
      },
      child: Container(
        width: ScreenUtil().setWidth(140),
        child: Icon(
          Icons.shopping_cart,
          size: 30
        ),
      ),
    );
  }

  Widget _btnCart(String title,Color color,VoidCallback callback){
    return Expanded(
      child: InkWell(
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          alignment: Alignment.center,
          child: Text(
            title,style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}