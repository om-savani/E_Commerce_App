import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/utils/products.dart';
import 'package:e_commerce_app/views/components/catagory.dart';
import 'package:e_commerce_app/views/extension.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selected = "All Products";
  RangeValues slidervalue = RangeValues(1, 5000);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    List images = [
      "https://www.iasexpress.net/wp-content/uploads/2022/08/E-commerce-sector-in-India-upsc.jpg",
      "https://blog-frontend.envato.com/cdn-cgi/image/width=2560,quality=75,format=auto/uploads/sites/2/2022/04/E-commerce-App-JPG-File-scaled.jpg",
      "https://img.freepik.com/free-vector/flat-landing-page-template-boxing-day-sales_23-2150994461.jpg?ga=GA1.1.147002530.1691682363&semt=ais_hybrid",
      "https://img.freepik.com/premium-photo/shopping-cart-with-bunch-presents-it_1059430-98817.jpg?ga=GA1.1.147002530.1691682363&semt=ais_hybrid"
    ];
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Home Page",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('CartPage');
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                30.toHeight(),
                CarouselSlider(
                  options: CarouselOptions(
                    height: size.height * 0.25,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                  ),
                  items: images.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                20.toHeight(),
                Row(
                  children: [
                    DropdownButton(
                      value: selected,
                      onChanged: (val) {
                        setState(() {
                          selected = val.toString();
                        });
                      },
                      items: [
                        const DropdownMenuItem(
                          value: 'All Products',
                          child: Text('All Products'),
                        ),
                        ...allCategory.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.tcase),
                            value: e,
                          );
                        }),
                      ],
                    ),
                    20.toWidth(),
                    Visibility(
                      visible: selected != "All Products",
                      child: ActionChip(
                        label: const Text("Clear"),
                        avatar: const Icon(Icons.close),
                        onPressed: () {
                          selected = "All Products";
                          slidervalue = const RangeValues(1, 5000);
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: selected != "All Products",
                  child: Row(
                    children: [
                      Text(
                        "From\n${slidervalue.start.toInt()}",
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: RangeSlider(
                            labels: RangeLabels(
                              slidervalue.start.toInt().toString(),
                              slidervalue.end.toInt().toString(),
                            ),
                            min: 1,
                            max: 10000,
                            values: slidervalue,
                            onChanged: (val) {
                              slidervalue = val;
                              setState(() {});
                            }),
                      ),
                      Text(
                        "From\n${slidervalue.end.toInt()}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                5.toHeight(),
                const Text(
                  "All products",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Catagory(
                  context: context,
                  selected: "All Products",
                ),
                5.toHeight(),
                Text(
                  selected.tcase,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Catagory(
                  context: context,
                  selected: selected,
                  slidervalue: slidervalue,
                ),
              ],
            ),
          ),
        ));
  }
}
