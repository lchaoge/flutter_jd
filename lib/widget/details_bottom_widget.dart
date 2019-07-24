import 'package:flutter/material.dart';
import 'package:flutter_jd/common/model/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/provide/cart_provide.dart';
import 'package:flutter_jd/provide/details_provide.dart';
import 'package:flutter_jd/provide/current_index_provide.dart';
import 'package:flutter_jd/common/model/details_model.dart';

class DetailsBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo =
        Provide.value<DetailsProvide>(context).goodsInfo.data.goodInfo;
    CartModel cartModel = new CartModel(
        goodsId: goodsInfo.goodsId,
        goodsName: goodsInfo.goodsName,
        count: 1,
        price: goodsInfo.presentPrice,
        images: goodsInfo.image1);

    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            _shopCart(context),
            _btnCart('加入购物车', Colors.green, () async {
              await Provide.value<CartProvide>(context).save(cartModel);
            }),
            _btnCart('立即购买', Colors.red, () async {
              await Provide.value<CartProvide>(context).removeCart();
            }),
          ],
        ));
  }

  Widget _shopCart(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            print('点击购物车');
            Provide.value<CurrentIndexProvide>(context).changeIndex(2);
            Navigator.pop(context);
          },
          child: Container(
            width: ScreenUtil().setWidth(140),
            child: Icon(Icons.shopping_cart, size: 30),
          ),
        ),
        Provide<CartProvide>(
          builder: (context, child, data) {
            int goodsCount = Provide.value<CartProvide>(context).allGoodsCount;
            return Positioned(
                right: 10.0,
                top: 0.0,
                child: Container(
                    padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text('$goodsCount',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(22)))));
          },
        )
      ],
    );
  }

  Widget _btnCart(String title, Color color, VoidCallback callback) {
    return Expanded(
      child: InkWell(
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
