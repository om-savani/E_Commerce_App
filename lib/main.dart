import 'package:e_commerce_app/views/detail_page.dart';
import 'package:e_commerce_app/views/homepage.dart';
import 'package:e_commerce_app/views/cart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      routes: {
        'home_page': (context) => const Homepage(),
        'detail_page': (context) => const DetailPage(),
        'CartPage': (context) => CartPage(),
      },
    );
  }
}
