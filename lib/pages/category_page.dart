import 'package:flutter/material.dart';
import 'package:flutter_jd/widget/left_category_nav_widget.dart';
import 'package:flutter_jd/widget/right_catepory_nav_widget.dart';
import 'package:flutter_jd/widget/category_goods_list_widget.dart';
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
