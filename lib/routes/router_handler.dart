import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_jd/pages/details_page.dart';


Handler detailsPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    print('index>details goodsId is ${goodsId}');
    return DetailsPage(goodsId);
  }
);