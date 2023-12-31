part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class CartProductAdded extends CartEvent {
final Product product;
const CartProductAdded(this.product);
  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
 final Product product;

const CartProductRemoved(this.product);

  @override
  List<Object> get props => [product];
}