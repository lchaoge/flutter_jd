import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_jd/common/model/cart_model.dart';

/**
 * 购物车
 */
class CartProvide with ChangeNotifier {
  String cartString = "[]";
  List<CartModel> cartModelList = [];
  double allPrice = 0; // 商品总数
  int allGoodsCount = 0; // 商品总数
  bool isAllCheck = true; // 全选

  /**
   * 增加商品
   */
  save(CartModel cartModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int index = 0;
    allPrice = 0; // 商品总数
    allGoodsCount = 0; // 商品总数

    tempList.forEach((item) {
      if (item['goodsId'] == cartModel.goodsId) {
        tempList[index]['count'] = item['count'] + 1;
        isHave = true;
      }
      cartModelList.add(CartModel.fromJson(tempList[index]));
      if (item['isCheck']) {
        allPrice += (tempList[index]['price'] * tempList[index]['count']);
        allGoodsCount += tempList[index]['count'];
      }
      index++;
    });
    if (!isHave) {
      Map<String, dynamic> newGoods = {
        "goodsId": cartModel.goodsId,
        "goodsName": cartModel.goodsName,
        "count": cartModel.count,
        "price": cartModel.price,
        "images": cartModel.images,
        "isCheck": true,
      };
      tempList.add(newGoods);
      cartModelList.add(CartModel.fromJson(newGoods));
      allPrice += (cartModel.count * cartModel.price);
      allGoodsCount += cartModel.count;
    }
    cartString = json.encode(tempList).toString();
    print(cartString);
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }

  /**
   * 清空购物车
   */
  removeCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    cartModelList = [];
    print('清空完成....');
    notifyListeners();
  }

  /**
   * 查看购物车商品
   */
  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    cartModelList = [];
    if (cartString != null) {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      allPrice = 0;
      allGoodsCount = 0;
      isAllCheck = true;
      tempList.forEach((item) {
        if (item['isCheck']) {
          allGoodsCount += item['count'];
          allPrice += (item['count'] * item['price']);
        } else {
          isAllCheck = false;
        }
        cartModelList.add(CartModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  /**
   * 删除单个购物车商品
   */
  deleteOneGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var carString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int delIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  /**
   * 单个商品勾选按钮
   */
  changeCheckState(CartModel cartModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == cartModel.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = cartModel.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  /**
   * 全选按钮
   */
  changeAllChange(bool isCheck) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    List<Map> newList = [];
    tempList.forEach((item) {
      item['isCheck'] = isCheck;
      newList.add(item);
    });
    cartString = json.encode(newList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  /**
   * 购物车数量
   */
  addOrReduceAction(CartModel cartModel, String todo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == cartModel.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    if (todo == 'add') {
      cartModel.count++;
    } else if (cartModel.count > 1) {
      cartModel.count--;
    } else {
      cartModel.count = 1;
    }
    tempList[changeIndex] = cartModel.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }
}
