import 'package:flutter/material.dart';

/**
 * 广告
 */
class AdBanner extends StatelessWidget {

  final String adPicture;

  AdBanner({Key key,this.adPicture}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Image.network(adPicture,fit: BoxFit.cover,),
      child: FadeInImage.assetNetwork(
        image: adPicture,
        fit: BoxFit.cover,
        placeholder: 'assets/images/jd_loading.png',
      ),
    );
  }
}