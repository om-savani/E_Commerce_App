import 'package:e_commerce_app/utils/products.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("E-Commerce"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Expanded(
              // flex: 2,
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                        children: allProduct
                            .map((e) => Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                    bottom: 5,
                                  ),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(e['images'][0]),
                                          fit: BoxFit.cover),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(e['title']),
                                      Text("\$ ${e['price']}"),
                                    ],
                                  ),
                                ))
                            .toList()),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: 500,
                // padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.greenAccent),
                child: Text("Container-2"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
