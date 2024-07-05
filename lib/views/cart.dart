import 'package:e_commerce_app/views/homepage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            onPressed: () {
              Route route = MaterialPageRoute(
                builder: (context) => Homepage(),
              );
              Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
            },
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
