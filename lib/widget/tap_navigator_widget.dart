import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 菜单
 */
class TapNavigator extends StatelessWidget {
  final List naviatorList;
  TapNavigator({Key key, this.naviatorList}) : super(key: key);

  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 5.0
            ),
            child:FadeInImage.assetNetwork(
              width: ScreenUtil().setWidth(75),
              image: item['image'],
              fit: BoxFit.cover,
              placeholder: 'assets/images/jd_loading.png',
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 8.0
            ),
            child: Text(item['name']),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(this.naviatorList.length>10){
      this.naviatorList.removeRange(10, this.naviatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: naviatorList.map((item) {
          return _gridViewItem(context, item);
        }).toList(),
      ),
    );
  }
}
