import 'package:flutter/material.dart';
import 'package:flutter_jd/common/provide/child_category_provide.dart';
import 'package:flutter_jd/pages/index_page.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/common/provide/counter.dart';
import 'package:flutter_jd/common/provide/category_goods_list_provide.dart';

void main() {
  var counter = Counter();
  var childCategoryProvide = ChildCategoryProvide();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var providers = Providers();
  providers
  ..provide(Provider<Counter>.value(counter))
  ..provide(Provider<ChildCategoryProvide>.value(childCategoryProvide))
  ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '京东商城',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(228, 49, 48, 1.0),
        ),
        home: IndexPage(),
      ),
    );
  }
}
