import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';


class HeroCarouselCard extends StatelessWidget {
  // const HeroCarouselCard({super.key});
  final Category category;

  const HeroCarouselCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/catalog', arguments: category);
      },
      child: Container(
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
                      Color.fromARGB(80, 0, 0, 0),
                      Color.fromARGB(00, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        )),
    ),
    );
  }
}