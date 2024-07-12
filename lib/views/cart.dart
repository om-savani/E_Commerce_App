import 'dart:ffi';
import 'package:flutter/material.dart';
import '../utils/products.dart';

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
              color: Colors.black,
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
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: cartitem.isEmpty
            ? const Center(
                child: Text("Empty Cart"),
              )
            : SingleChildScrollView(
                child: Column(
                  children: cartitem
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 3,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    e['thumbnail'],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cartitem.remove(e);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(e['qty'].toString()),
                                IconButton(
                                  onPressed: () {
                                    e['qty']++;
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
      ),
    );
  }
}
