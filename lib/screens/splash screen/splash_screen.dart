import 'dart:async';

import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';


class SplashScreen extends StatelessWidget {

  static const String routeName = '/splashscreen';


  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      fullscreenDialog: false,
      builder: (_) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
Timer(Duration(seconds: 2), () { 
// Navigator.pushNamed(context, '/');
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
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