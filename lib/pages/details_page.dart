import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_jd/common/provide/details_provide.dart';
import 'package:flutter_jd/common/widget/details_top_area_widget.dart';

class DetailsPage extends StatelessWidget {

  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.arrow_back,),
            onPressed:(){
              Navigator.pop(context);
            }
          ),
          title: Text('详细信息'),
        ),
        body: FutureBuilder(
          future: _getBackInfo(context),
          builder: (context,snapshot){
            // if(snapshot.hasData){
              return Container(
                child: Column(
                  children: <Widget>[
                    DetailsTopAreaWidget(),
                  ],
                ),
              );
            // }else{
            //   return Text('加载中...');
            // }
          },
        ),
      )
    );
  }

  Future _getBackInfo(BuildContext context) async{
    await Provide.value<DetailsProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}