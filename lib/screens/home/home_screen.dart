import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      appBar: CustomAppBar(
        title: 'шестерочка'
      ),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: false,
                enlargeStrategy: CenterPageEnlargeStrategy.height
              ),
              items: Category.categories.map((category) => HeroCarouselCard(category: category)).toList(),
            ),
          ),
          SectionTitle(
            title: 'Recommend'),
            ProductCarousel(products: Product.products.where((product) => product.isRecommended).toList()),
               SectionTitle(
            title: 'Most Popular'),
            ProductCarousel(products: Product.products.where((product) => product.isPopular).toList()),
        ],
      ),
    );
  }
}

