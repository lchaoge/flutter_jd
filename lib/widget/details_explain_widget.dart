import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 说明
 */
class DetailsExplainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Text( 
        '说明：>急速送达>正品保证',
        style: TextStyle(
          color: Colors.pink[200],
        ),
      ),
    );
  }
}