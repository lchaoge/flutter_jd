import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_jd/common/model/category_model.dart';
import 'package:flutter_jd/common/provide/child_category_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/common/provide/category_goods_list_provide.dart';
import 'package:flutter_jd/common/model/category_goods_list_model.dart';
import 'package:flutter_jd/common/service/service_method.dart';
import 'dart:convert';

class RightCateporyNav extends StatefulWidget {
  @override
  _RightCateporyNavState createState() => _RightCateporyNavState();
}

class _RightCateporyNavState extends State<RightCateporyNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategoryProvide>(
      builder: (context, child, childCategory) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          height: ScreenUtil().setHeight(80.0),
          width: ScreenUtil().setWidth(550.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return _rightInkWell(
                  index, childCategory.childCategoryList[index]);
            },
          ),
        );
      },
    );
  }

  Widget _rightInkWell(int index, BxMallSubDto item) {
    bool isClick = false;
    isClick = (index == Provide.value<ChildCategoryProvide>(context).childIndex)
        ? true
        : false;
    return InkWell(
      onTap: () {
        _getGoodsList(item.mallSubId);
        Provide.value<ChildCategoryProvide>(context).changeChildIndex(index,item.mallSubId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          '${item.mallSubName}',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28.0),
              color: isClick ? Colors.pink : Colors.black),
        ),
      ),
    );
  }

  void _getGoodsList(String categorySubId) async {
    var data = {
      'categoryId': Provide.value<ChildCategoryProvide>(context).categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };
    await request('getMallGoods', formData: data).then((val) {
      // var data = json.decode(val.toString());
      var data = """
        {"code":"0","message":"success","data":[{"image":"http://images.baixingliangfan.cn/compressedPic/20190115185215_1051.jpg","oriPrice":2.00,"presentPrice":1.80,"goodsName":"燕京啤酒8°330ml","goodsId":"522a3511f4c545ab9547db074bb51579"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121102419_9362.jpg","oriPrice":1.98,"presentPrice":1.80,"goodsName":"崂山清爽8°330ml","goodsId":"bbdbd5028cc849c2998ff84fb55cb934"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181330_9746.jpg","oriPrice":2.50,"presentPrice":1.90,"goodsName":"雪花啤酒8°清爽330ml","goodsId":"87013c4315e54927a97e51d0645ece76"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180233_4501.jpg","oriPrice":2.50,"presentPrice":2.20,"goodsName":"崂山啤酒8°330ml","goodsId":"86388a0ee7bd4a9dbe79f4a38c8acc89"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190116164250_1839.jpg","oriPrice":2.50,"presentPrice":2.30,"goodsName":"哈尔滨小麦王10°330ml","goodsId":"d31a5a337d43433385b17fe83ce2676a"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181139_2653.jpg","oriPrice":2.70,"presentPrice":2.50,"goodsName":"三得利清爽啤酒10°330ml","goodsId":"74a1fb6adc1f458bb6e0788c4859bf54"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121162731_3928.jpg","oriPrice":2.75,"presentPrice":2.50,"goodsName":"三得利啤酒7.5度超纯啤酒330ml","goodsId":"d52fa8ba9a5f40e6955be9e28a764f34"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180452_721.jpg","oriPrice":4.50,"presentPrice":3.70,"goodsName":"青岛啤酒11°330ml","goodsId":"a42c0585015540efa7e9642ec1183940"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121170407_7423.jpg","oriPrice":4.40,"presentPrice":4.00,"goodsName":"三得利清爽啤酒500ml 10.0°","goodsId":"94ec3df73f4446b5a5f0d80a8e51eb9d"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181427_6101.jpg","oriPrice":4.50,"presentPrice":4.00,"goodsName":"雪花勇闯天涯啤酒8°330ml","goodsId":"d80462faab814ac6a7124cec3b868cf7"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180717151537_3425.jpg","oriPrice":4.90,"presentPrice":4.10,"goodsName":"百威啤酒听装9.7°330ml","goodsId":"91a849140de24546b0de9e23d85399a3"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121101926_2942.jpg","oriPrice":4.95,"presentPrice":4.50,"goodsName":"崂山啤酒8°500ml","goodsId":"3758bbd933b145f2a9c472bf76c4920c"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712175422_518.jpg","oriPrice":5.00,"presentPrice":4.50,"goodsName":"百威3.6%大瓶9.7°P460ml","goodsId":"dc32954b66814f40977be0255cfdacca"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180717151454_4834.jpg","oriPrice":5.00,"presentPrice":4.50,"goodsName":"青岛啤酒大听装500ml","goodsId":"fc85510c3af7428dbf1cb0c1bcb43711"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181007_4229.jpg","oriPrice":5.50,"presentPrice":5.00,"goodsName":"三得利金纯生啤酒580ml 9°","goodsId":"14bd89f066ca4949af5e4d5a1d2afaf8"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121100752_4292.jpg","oriPrice":6.60,"presentPrice":6.00,"goodsName":"哈尔滨啤酒冰纯白啤（小麦啤酒）500ml","goodsId":"89bccd56a8e9465692ccc469cd4b442e"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712175656_777.jpg","oriPrice":7.20,"presentPrice":6.60,"goodsName":"百威啤酒500ml","goodsId":"3a94dea560ef46008dad7409d592775d"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180754_2838.jpg","oriPrice":7.78,"presentPrice":7.00,"goodsName":"青岛啤酒皮尔森10.5°330ml","goodsId":"97adb29137fb47689146a397e5351926"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190116164149_2165.jpg","oriPrice":7.78,"presentPrice":7.00,"goodsName":"青岛全麦白啤11°500ml","goodsId":"f78826d3eb0546f6a2e58893d4a41b43"}]}
      """;
      var listData = json.decode(data);
      print('分类商品列表：》》》》》》》》》》》》》》${val}');
      CategoryGoodsListModel goodsList =
          CategoryGoodsListModel.fromJson(listData);
      if (goodsList.data == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getGoodsList(goodsList.data);
      }
    });
  }
}
