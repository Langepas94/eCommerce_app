
import 'package:ecommerce_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/screens.dart';

class AppRouters {
 static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
  switch(settings.name){
    case '/': 
    return HomeScreen.route();
    case HomeScreen.routeName: 
    return HomeScreen.route();
    case CartScreen.routeName:
    return CartScreen.route();
    case ProductScreen.routeName: 
    return ProductScreen.route();
    case WhislListScreen.routeName: 
    return WhislListScreen.route();
    case CatalogScreen.routeName:
    return CatalogScreen.route(category: settings.arguments as Category);
    default: return _errorRoute();
  }
 }

 static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'),)),
    );
 }
}

