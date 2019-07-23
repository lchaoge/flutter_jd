import 'package:flutter/material.dart';
import 'package:flutter_jd/common/model/category_goods_list_model.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryListData> goodsList = [];
  
  // 点击大类  更换商品列表
  getGoodsList(List<CategoryListData> list){
    goodsList = list;
    notifyListeners();
  }

}