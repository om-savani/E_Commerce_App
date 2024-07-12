import 'package:e_commerce_app/utils/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget Catagory(
    {required BuildContext context,
    required selected,
    RangeValues slidervalue = const RangeValues(1, 10000)}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: allProduct
                  .where((e) => selected == 'All Products'
                      ? true
                      : selected == e['category'] &&
                          e['price'] >= slidervalue.start &&
                          e['price'] <= slidervalue.end)
                  .map((e) => GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('detail_page', arguments: e);
                        },
                        child: Container(
                          height: 250,
                          width: 170,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                            right: 15,
                            bottom: 20,
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
                                  // spreadRadius: 5,
                                  offset: Offset(10, 10),
                                  blurRadius: 10,
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
                              Text(
                                e['title'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
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
    ],
  );
}
