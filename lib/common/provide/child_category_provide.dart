import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jd/common/model/category_model.dart';

class ChildCategoryProvide with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; // 子类索引

  getChildCategory(List<BxMallSubDto> list){
    childIndex = 0;
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
  changeChildIndex(int index){
    childIndex = index;
    notifyListeners();
  }

}