import 'package:e_commerce_app/utils/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/amazon.png'))),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.orange),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: allProduct
                          .map((e) => Container(
                                alignment: Alignment.bottomCenter,
                                height: 250,
                                width: 150,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(
                                  right: 20,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 5,
                                          offset: Offset(5, 5),
                                          blurRadius: 7)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Image(
                                      image: NetworkImage(
                                        e['thumbnail'],
                                      ),
                                    )),
                                    Text(e['title']),
                                    Text("\$ ${e['price']}"),
                                    Expanded(
                                      child: RatingBar.builder(
                                        initialRating: e['rating'].toDouble(),
                                        direction: Axis.horizontal,
                                        itemSize: 17,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    )
                                  ],
                                ),
                              ))
                          .toList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
