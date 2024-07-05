import 'package:e_commerce_app/utils/products.dart';
import 'package:e_commerce_app/views/detail_page.dart';
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
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: allProduct
                        .map((e) => GestureDetector(
                              onTap: () {
                                Route route = MaterialPageRoute(
                                  builder: (context) => DetailPage(Product: e),
                                );
                                Navigator.of(context).push(route);
                              },
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                height: size.height * 0.3,
                                width: size.width * 0.4,
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
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 5,
                                        offset: Offset(5, 5),
                                        blurRadius: 7,
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        child: Image(
                                      image: NetworkImage(
                                        e['thumbnail'],
                                      ),
                                    )),
                                    Text(e['title']),
                                    Text("\$ ${e['price']}"),
                                    SizedBox(
                                      child: RatingBar.builder(
                                        initialRating: e['rating'].toDouble(),
                                        direction: Axis.horizontal,
                                        itemSize: 17,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList()),
              ),
            ),
            const SizedBox(height: 10),
            // SizedBox(
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: allCategory
            //           .map(
            //             (e) => const SizedBox(
            //               child: Row(
            //                 children: [
            //                   Padding(
            //                     padding: EdgeInsets.only(right: 20),
            //                   ),
            //                   CircleAvatar(
            //                     radius: 40,
            //                     backgroundColor: Colors.purple,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           )
            //           .toList(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
