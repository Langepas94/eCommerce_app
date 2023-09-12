import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:flutter/material.dart';
import '/screens/screens.dart';
import 'blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StarWishList()),),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart()),)
      ],
      child: MaterialApp(
        title: 'Hello',
        theme: theme(),
        onGenerateRoute: AppRouters.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
