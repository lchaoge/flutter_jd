import 'package:flutter/material.dart';
import 'package:flutter_jd/provide/cart_provide.dart';
import 'package:flutter_jd/provide/child_category_provide.dart';
import 'package:flutter_jd/pages/index_page.dart';
import 'package:flutter_jd/provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/provide/category_goods_list_provide.dart';
import 'package:flutter_jd/provide/details_provide.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_jd/routes/routes.dart';
import 'package:flutter_jd/routes/router_static.dart';

void main() {
  var providers = Providers();

  providers
  ..provide(Provider<CurrentIndexProvide>.value(CurrentIndexProvide()))
  ..provide(Provider<ChildCategoryProvide>.value(ChildCategoryProvide()))
  ..provide(Provider<CategoryGoodsListProvide>.value(CategoryGoodsListProvide()))
  ..provide(Provider<DetailsProvide>.value(DetailsProvide()))
  ..provide(Provider<CartProvide>.value(CartProvide()));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    RouterStatic.router = router;

    return Container(
      child: MaterialApp(
        title: '京东商城',
        onGenerateRoute: RouterStatic.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.iOS, // 滑动返回
          primaryColor: Color.fromRGBO(228, 49, 48, 1.0),
        ),
        home: IndexPage(),
      ),
    );
  }
}
