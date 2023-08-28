import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:flutter/material.dart';
import '/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      theme: theme(),
      onGenerateRoute: AppRouters.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      home: HomeScreen(),
    );
  }
}





