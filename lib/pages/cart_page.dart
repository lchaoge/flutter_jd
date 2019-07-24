import 'package:flutter/material.dart';
import 'package:flutter_jd/common/model/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_jd/provide/cart_provide.dart';
import 'package:flutter_jd/widget/cart_item_widget.dart';
import 'package:flutter_jd/widget/cart_bottom_widget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> textList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车'),),
      body: FutureBuilder(
        future:_getCartInfo(context),
        builder: (context,shapshot){
          // if(shapshot.hasData){
            var cartList = Provide.value<CartProvide>(context).cartModelList;
            return Stack(
              children: <Widget>[
                Provide<CartProvide>(
                  builder: (context,child,data){
                    cartList = cartList = Provide.value<CartProvide>(context).cartModelList;
                    return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (BuildContext context,int index){
                        return CartItemWidget(cartList[index],index);
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  width: ScreenUtil().setWidth(750),
                  child: CartBottomWidget(),
                )
              ],
            );
          // }else{
          //   return Text('正在加载数据...');
          // }
          
        },
      )
      
    );
  }

  Future<String> _getCartInfo(BuildContext context) async{
    print('获取购物车数据');
    await Provide.value<CartProvide>(context).getCartInfo();
  }
  
}
