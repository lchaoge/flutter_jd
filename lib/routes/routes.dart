import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_jd/routes/router_handler.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static String jpushPage = '/jpush';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('页面没有找到');
    });

    // 详情
    router.define(detailsPage, handler: detailsPageHandler);
    // 极光推送
    router.define(jpushPage, handler: jpushPageHandler);

  }
}
