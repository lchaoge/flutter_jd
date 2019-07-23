import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter_jd/common/config/servcie_url.dart';
import 'package:flutter_jd/common/config/http_headers.dart';


Future request(url, {formData}) async {
  try {
    print(servicePath[url]);
    print('开始获取数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencodeed");
    if(formData==null){
      response = await dio.post(servicePath[url]);
    }else{
      response = await dio.post(servicePath[url], data: formData);
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

Future getHomePageContent() async {
  try {
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType = ContentType.parse("application/json");
    // dio.options.headers = httpHeaders;
    // var params = {"lon": "39.9316564326", "lat": "116.2767219543"};
    // print(servicePath['homePageContent']);
    response = await dio.get('https://resources.ninghao.net/demo/posts.json');
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

// 获得火爆专区信息
Future getHomePageBeloConten(Map page) async {
  try {
    print('获得火爆专区信息...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/json");
    dio.options.headers = httpHeaders;
    print(servicePath['homePageBelowConten']);
    response = await dio.post(servicePath['homePageBelowConten'], data: page);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

