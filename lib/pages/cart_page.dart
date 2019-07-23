import 'package:flutter/material.dart';
import 'package:flutter_jd/common/provide/counter.dart';
import 'package:provide/provide.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            NumberWidget(),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(
        builder: (context, child, counter) {
          return Text('${counter.value}',style: Theme.of(context).textTheme.display1,);
        },
      )
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed:(){
          Provide.value<Counter>(context).increment();
        },
        child:Text('递增')
      ),
    );
  }
}
