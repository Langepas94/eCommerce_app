import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const ProductCard(
      {super.key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5,
      this.isWishList = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageURL,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
              top: 65,
              left: leftPosition + 5,
              child: Container(
                width: MediaQuery.of(context).size.width / widthFactor -
                    10 -
                    leftPosition,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {

                          if (state is CartLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is CartLoaded) {
                               return Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(CartProductAdded(product));
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                )),
                          );
                          }
                         else {
                          return Text('Something wrong');
                         }
                        },
                      ),
                      isWishList
                          ? Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  )),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
