import 'package:flutter/material.dart';
import 'package:flutter_jd/common/widget/left_category_nav.dart';
import 'package:flutter_jd/common/widget/right_catepory_nav.dart';
import 'package:flutter_jd/common/widget/category_goods_list.dart';
import 'package:flutter_jd/common/model/category_goods_list_model.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('商品分类'),
            elevation: 0.0,
          ),
          body: Row(
            children: <Widget>[
              LeftCategoryNav(),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    RightCateporyNav(),
                    CategoryGoodsList(),
                  ],
                ),
              )
            ],
          )
        ),
    );
  }
}
