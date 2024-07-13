import 'package:e_commerce_app/views/extension.dart';
import 'package:flutter/material.dart';
import '../utils/products.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

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
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: NetworkImage(
                          "https://cdn.dribbble.com/users/5107895/screenshots/14532312/media/a7e6c2e9333d0989e3a54c95dd8321d7.gif")),
                  Text(
                    "Your Cart Is Empty!!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
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
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    child: Image(
                                      image: NetworkImage(
                                        e['thumbnail'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(3, 3),
                                              blurRadius: 3)
                                        ]),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['title'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      5.toHeight(),
                                      Text(
                                        "\$ ${e['price']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  e['qty'] >= 1
                                                      ? e['qty']--
                                                      : cartitem.remove(e);
                                                  setState(() {});
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                )),
                                            3.toWidth(),
                                            Container(
                                              child: Text(
                                                e['qty'].toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            3.toWidth(),
                                            IconButton(
                                                onPressed: () {
                                                  e['qty']++;
                                                  setState(() {});
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                )),
                                            ElevatedButton(
                                                onPressed: () {
                                                  cartitem.remove(e);
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.delete_forever,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
