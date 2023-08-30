import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';


class CatalogScreen extends StatelessWidget {

  static const String routeName = '/catalog';
  final Category category;

  const CatalogScreen({
    super.key,
    required this.category
  
    });

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name
      ),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0, 
          vertical: 16.0
          ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.15), 
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
         return Center(
          child: ProductCard(
            product: categoryProducts[index],
            widthFactor: 2.2,
            )
            );
        },
        ),
    );
  }
}