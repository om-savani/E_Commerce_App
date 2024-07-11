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
            icon: const Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('home_page', (route) => false);
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
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
