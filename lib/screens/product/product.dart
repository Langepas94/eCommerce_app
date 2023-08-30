import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatelessWidget {

  final Product product;

  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
    );
  }

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name
      ),
      bottomNavigationBar: 
      BottomAppBar(
        color: Colors.black,
        child: Container(
              height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                 icon: Icon(Icons.share, color: Colors.white,)
                 ),
                 IconButton(
                onPressed: () {},
                 icon: Icon(Icons.favorite, color: Colors.white,)
                 ),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: (){}, 
                  child: Text(
                    'Add to cart',
                    style: Theme.of(context).textTheme.headline3,
                    )
                  )
            ],
          ),

        ),
        )
      ,
      body: ListView(
        children: [CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height
                ),
                items: [HeroCarouselCard(product: product,)],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      color: Colors.black.withAlpha(50),

                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 50,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name, 
                              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                              ),
                            Text(
                              '${product.price}', 
                              style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
                              )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    'Product Information',
                    style: Theme.of(context).textTheme.headline3,
                    ),
                    children: [
                      ListTile(
                        title: Text('Они сошлись. Волна и камень, Стихи и проза, лед и пламень, Не столь различны меж собой.',
                        style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ExpansionTile(
                  title: Text(
                    'Delivery Information',
                    style: Theme.of(context).textTheme.headline3,
                    ),
                    children: [
                      ListTile(
                        title: Text('Они сошлись. Волна и камень, Стихи и проза, лед и пламень, Не столь различны меж собой.',
                        style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )
                    ],
                  ),
              )
              ],
      ),
    );
  }
}