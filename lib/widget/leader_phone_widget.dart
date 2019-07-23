import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  void _lanchURL() async {
    String url = 'tel:' + leaderPhone;
    // String url ='https://www.baidu.com';
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '不能进行访问';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _lanchURL,
        child: Image.network(
          leaderImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
