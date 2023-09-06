
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc(): super(WishlistLoading()) {
on<StarWishList>(_onStartWishList);
on<AddWishListProduct>(_onAddProductToWishlist);
on<RemoveWishListProduct>(_onRemoveProductToWishlist);
  }
  
void _onStartWishList(StarWishList event, Emitter<WishlistState> emit ) async {
  emit(WishlistLoading());

  try {
await Future<void>.delayed(const Duration(seconds: 1));
emit(WishlistLoaded());
  } catch (_) {

  }
}

void _onAddProductToWishlist(AddWishListProduct event, Emitter<WishlistState> emit ) async {
if (this.state is WishlistLoaded) {
  try {
    emit(
      WishlistLoaded(
        wishlist: Wishlist(
          products: List.from((this.state as WishlistLoaded).wishlist.products)..add(event.product)
        )
      )
    );
  } on Exception {
    emit(WishlistError());
  }
}
}

void _onRemoveProductToWishlist(RemoveWishListProduct event, Emitter<WishlistState> emit ) async {
if (this.state is WishlistLoaded) {
  try {
    emit(
      WishlistLoaded(
        wishlist: Wishlist(
          products: List.from((this.state as WishlistLoaded).wishlist.products)..remove(event.product)
        )
      )
    );
  } on Exception {
    emit(WishlistError());
  }
}
}

}



