import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jd/common/model/category_model.dart';

class ChildCategoryProvide with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; // 子类索引
  String categoryId = '4'; // 大类ID
  String subId = ''; // 小类ID
  int page = 1;
  String noMoreText = ''; // 显示没有数据的文字


  getChildCategory(List<BxMallSubDto> list,String id){
    page = 1;
    noMoreText = '';
    childIndex = 0;
    categoryId = id;
    BxMallSubDto all = BxMallSubDto(
      mallSubId: '00',
      mallCategoryId: '00',
      mallSubName: '全部',
      comments: 'null'
    );
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  // 改变子类索引
  changeChildIndex(int index,String id){
    page = 1;
    noMoreText = '';
    childIndex = index;
    subId = id;
    notifyListeners();
  }

  // 增加page的方法
  loadMore(){
    page++;
  }

  changeNoMoreText(String text){
    noMoreText = text;
    notifyListeners();
  }

}