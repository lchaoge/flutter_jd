import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_jd/common/model/cart_model.dart';
import 'package:flutter_jd/widget/cart_count_widget.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/provide/cart_provide.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartModel;
  final int index;
  CartItemWidget(this.cartModel,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 1.0,
          color: Colors.grey[100],
        )),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBtn(context,cartModel),
          _cartImage(),
          _cartGoodsName(context,cartModel,index),
          _cartPrice(context),
        ],
      ),
    );
  }

  // 多选按钮
  Widget _cartCheckBtn(BuildContext context,CartModel item) {
    return Container(
      child: Checkbox(
        value: cartModel.isCheck,
        activeColor: Colors.pink,
        onChanged: (bool value) {
          cartModel.isCheck = value;
          Provide.value<CartProvide>(context).changeCheckState(item);
        },
      ),
    );
  }

  // 图片
  Widget _cartImage() {
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Colors.grey[100],
      )),
      child: Image.network(
        cartModel.images,
        fit: BoxFit.cover,
      ),
    );
  }

  // 商品名称
  Widget _cartGoodsName(BuildContext context,CartModel cartModel,int index) {
    return Container(
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cartModel.goodsName,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          CartCountWidget(cartModel),
        ],
      ),
    );
  }

  // 商品 价格
  Widget _cartPrice(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text(
            '${cartModel.price}',
          ),
          Text(
            '${cartModel.price}',
            style: TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                print('删除 单个商品');
                Provide.value<CartProvide>(context).deleteOneGoods(cartModel.goodsId);
              },
              child: Icon(Icons.delete_forever, color: Colors.grey, size: 28),
            ),
          )
        ],
      ),
    );
  }
}
