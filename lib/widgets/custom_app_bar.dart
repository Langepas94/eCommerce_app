import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 2
      ),
      child: Text(
          title,
              style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
      ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: () {
        Navigator.pushNamed(context, '/wishlist');
      }, icon: Icon(Icons.favorite))],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(50.0);
}