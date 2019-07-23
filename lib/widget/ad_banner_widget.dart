import 'package:flutter/material.dart';
import 'package:flutter_jd/routes/router_static.dart';

/**
 * 广告
 */
class AdBanner extends StatelessWidget {

  final String adPicture;

  AdBanner({Key key,this.adPicture}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          RouterStatic.router.navigateTo(context, '/detail?id="123"');
        },
        child: Image.network(adPicture,fit: BoxFit.cover,),
      ),
      // child: Image.network(adPicture,fit: BoxFit.cover,),
      // child: FadeInImage.assetNetwork(
      //   image: adPicture,
      //   fit: BoxFit.cover,
      //   placeholder: 'assets/images/jd_loading.png',
      // ),
    );
  }
}