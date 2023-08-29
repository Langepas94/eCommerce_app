import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/category_model.dart';
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
      body: Container(
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
    );
    //   bottomNavigationBar: CustomNavBar(),
    // );
  }
}

class HeroCarouselCard extends StatelessWidget {
  // const HeroCarouselCard({super.key});
  final Category category;

  const HeroCarouselCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
  child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.network(category.imageURL, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0),
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      )),
);
  }
}