import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_jd/common/model/category_goods_list_model.dart';
import 'package:flutter_jd/provide/category_goods_list_provide.dart';
import 'package:flutter_jd/common/service/service_method.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_jd/provide/child_category_provide.dart';
import 'package:provide/provide.dart';
import 'package:fluttertoast/fluttertoast.dart';
/**
 * 商品列表
 * 上啦加载
 */

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  GlobalKey<RefreshFooterState> _footerkey =
      new GlobalKey<RefreshFooterState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (BuildContext context, child, data) {
        if (data.goodsList.length > 0) {
          return Expanded(
            child: Container(
                width: ScreenUtil().setWidth(550),
                // height: ScreenUtil().setHeight(1000),
                child: EasyRefresh(
                  refreshFooter: ClassicsFooter(
                    key: _footerkey,
                    bgColor: Colors.transparent,
                    textColor: Colors.grey,
                    moreInfoColor: Colors.grey,
                    showMore: true,
                    noMoreText: Provide.value<ChildCategoryProvide>(context).noMoreText,
                    moreInfo: '',
                    loadReadyText: '释放加载...',
                    loadingText: '加载中...',
                    loadedText: '上拉加载...',
                    loadText: '上拉加载...',
                    
                  ),
                  loadMore: () async {
                    print('加载更多');
                    Fluttertoast.showToast(
                      msg: "没有更多数据",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.pink,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: ListView.builder(
                    itemCount: data.goodsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _goodsInkWell(data.goodsList, index);
                    },
                  ),
                )),
          );
        } else {
          return Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text('暂无数据'),
          );
        }
      },
    );
  }

  Widget _goodsInkWell(List goodsList, int index) {
    return InkWell(
      onTap: () {
        print(index);
        Fluttertoast.showToast(
          msg: "没有更多数据",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ))),
        child: Row(
          children: <Widget>[
            _goodsImage(goodsList, index),
            Column(
              children: <Widget>[
                _goodsName(goodsList, index),
                _goodsPrice(goodsList, index),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _goodsImage(List goodsList, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(
        goodsList[index].image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _goodsName(List goodsList, int index) {
    return Container(
        padding: EdgeInsets.all(5.0),
        width: ScreenUtil().setWidth(350),
        child: Text(goodsList[index].goodsName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: ScreenUtil().setSp(28.0))));
  }

  Widget _goodsPrice(List goodsList, int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '价格：￥${goodsList[index].presentPrice}',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(20.0),
          ),
          Text(
            '￥${goodsList[index].oriPrice}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
