import 'dart:async';

import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';


class SplashScreen extends StatelessWidget {

  static const String routeName = '/splashscreen';


  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
Timer(Duration(seconds: 2), () { 
Navigator.pushNamed(context, '/');
});
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(image: NetworkImage('https://i.timeout.ru/pix/567416.png'),
          width: 125,
          height: 125,
          
          ),
          ),
          Container(child: 
          Text('Ecommerce App', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),)
          ,)
        ],
      ),
    );
  }
}