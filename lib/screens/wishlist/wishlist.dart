import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';


class WhislListScreen extends StatelessWidget {

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WhislListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Wishlist'
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}