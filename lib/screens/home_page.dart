// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gorev_emre_hoca/model/product_model.dart';
import 'package:gorev_emre_hoca/screens/all_products_page.dart';
import 'package:gorev_emre_hoca/screens/produc_details_page.dart';
import 'package:gorev_emre_hoca/service/product_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductModel>> _categoryListFuture;
  late PageController _pageController;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _categoryListFuture = CategoryService.getCategoryData();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const Duration pageChangeDuration = Duration(seconds: 5);
    int totalPages = 3;
    int currentPage = 0;

    _timer = Timer.periodic(
      pageChangeDuration,
      (timer) {
        if (currentPage < totalPages - 1) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        _pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  List<String> categories = [
    "Electronics",
    "Jewelery",
    "Mens",
    "Womens",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Category',
          style: TextStyle(fontFamily: 'Maven', fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'view all',
              style: TextStyle(
                color: Color.fromRGBO(255, 110, 78, 1),
                fontFamily: "Maven",
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _categoryListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _startTimer();
            return Column(
              children: [
                Expanded(
                  child: categoriesExtract(),
                ),
                Expanded(
                    flex: 0.5.toInt(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Hot sales",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Maven",
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "see more",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 110, 78, 1),
                                fontFamily: "Maven"),
                          ),
                        )
                      ],
                    )),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: PageView(
                      controller: _pageController,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/images/iphoneFoto.png",
                            ),
                            Positioned(
                              top: 48,
                              left: 30,
                              child: Text(
                                "Iphone 12",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Maven",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 80,
                              left: 30,
                              child: Text(
                                "Súper. Mega. Rápido.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ),
                            Positioned(
                              bottom: 75,
                              left: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Buy now!",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 30,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    Color.fromRGBO(255, 110, 78, 1),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Maven",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              "assets/images/macbook.png",
                            ),
                            Positioned(
                              top: 20,
                              left: 115,
                              child: Text(
                                "Macbook Pro",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Maven",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            /* Positioned(
                              top: 80,
                              left: 30,
                              child: Text(
                                "Súper. Mega. Rápido.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ), */
                            Positioned(
                              bottom: 75,
                              left: 20,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey)),
                                child: Text(
                                  "Buy now!",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 30,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    Color.fromRGBO(255, 110, 78, 1),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Maven",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                "assets/images/airpods.jpg",
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 115,
                              child: Text(
                                "Airpods Max",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Maven",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 40,
                              left: 10,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Buy now!",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 30,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    Color.fromRGBO(255, 110, 78, 1),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Maven",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0.1.toInt(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "Best Seller",
                          style: TextStyle(
                              fontFamily: "Maven",
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        ////bu container önemli
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllProducts(),
                              ),
                            );
                          },
                          child: Text(
                            "see more",
                            style: TextStyle(
                                fontFamily: "Maven",
                                color: Color.fromRGBO(255, 110, 78, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: productsExtract(snapshot),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: No data received'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  ListView categoriesExtract() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) => Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  style: TextStyle(
                    fontFamily: "Maven",
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  categories[index],
                  textAlign: TextAlign.center,
                )
              ],
            ),
            backgroundImage: AssetImage(
              "assets/images/${categories[index].toLowerCase()}.png",
            ),
            radius: 48,
          ),
        ),
      ),
    );
  }

  Padding productsExtract(AsyncSnapshot<List<ProductModel>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: GridView.count(
        crossAxisCount: 2,
        children: snapshot.data!.map((product) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      productModel: product,
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.white,
                elevation: 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    ListTile(
                      subtitle: Text('${product.category.toString()}'),
                      title: Text('\$${product.price.toString()}'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
