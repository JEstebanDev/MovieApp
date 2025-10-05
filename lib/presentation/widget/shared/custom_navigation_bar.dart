import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_max)),
        BottomNavigationBarItem(
          label: "Categories",
          icon: Icon(Icons.label_outline),
        ),
        BottomNavigationBarItem(
          label: "Favorites",
          icon: Icon(Icons.favorite_outline),
        ),
      ],
    );
  }
}
