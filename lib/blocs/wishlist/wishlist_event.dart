part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}


class StarWishList extends WishlistEvent {

}

class AddWishListProduct extends WishlistEvent {
  final Product product;

  const AddWishListProduct({required this.product});

   @override
  List<Object> get props => [product];
}

class RemoveWishListProduct extends WishlistEvent {
  final Product product;

  const RemoveWishListProduct({required this.product});

   @override
  List<Object> get props => [product];
}