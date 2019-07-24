import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList});

  // 标题
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  // 商品单独项
  Widget _item(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(
                    width: index == 0 ? 0 : 0.5, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            FadeInImage.assetNetwork(
              image: '${recommendList[index]['image']}',
              fit: BoxFit.cover,
              placeholder: 'assets/images/jd_loading.png',
            ),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // 横向 列表
  Widget _recommedList() {
    return Container(
        height: ScreenUtil().setHeight(330),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _item(index);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtil().setHeight(400),
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommedList()],
      ),
    );
  }
}
