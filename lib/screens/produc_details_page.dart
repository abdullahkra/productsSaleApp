// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import, unused_import, sort_child_properties_last
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gorev_emre_hoca/consts/const_sabitler.dart';
import 'package:gorev_emre_hoca/model/product_model.dart';
import 'package:gorev_emre_hoca/service/product_service.dart';
//ddd
class DetailsPage extends StatefulWidget {
  final ProductModel productModel;
  const DetailsPage({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 223, 220, 220),
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(1, 0, 53, 1),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Sabitler.iconColor,
            ),
            child: Icon(
              Icons.paste,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Product Details",
              style: TextStyle(
                  fontFamily: "Maven",
                  fontWeight: FontWeight.w100,
                  fontSize: 18,
                  color: Color.fromRGBO(1, 0, 53, 1)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                /* titleContainerExtract(), */
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(76, 95, 143, 0.1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: imageContainerExtract(),
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(76, 95, 143, 0.1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: 320,
                  width: 450,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text(
                              widget.productModel.title,
                              style: TextStyle(
                                fontFamily: "Maven",
                                fontSize: 24,
                                color: Color.fromRGBO(1, 0, 53, 1),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white54,
                                size: 20,
                              ),
                              backgroundColor: Color.fromRGBO(1, 0, 53, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RatingBar(
                            ratingWidget: RatingWidget(
                              full: Icon(Icons.star,
                                  color: Color.fromRGBO(255, 184, 0, 1)),
                              half: Icon(Icons.star_half),
                              empty: Icon(Icons.star_border),
                            ),
                            initialRating: widget.productModel.rating.rate,
                            itemSize: 18,
                            onRatingUpdate: (rating) {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: Text(
                                  "Shop",
                                  style: TextStyle(
                                      fontFamily: "Maven",
                                      color: Color.fromRGBO(1, 0, 53, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Visibility(
                                visible: isVisible,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Sabitler.iconColor,
                                ),
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Details",
                              style: TextStyle(
                                  fontFamily: "Maven",
                                  color: Color.fromRGBO(1, 0, 53, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Features",
                              style: TextStyle(
                                  fontFamily: "Maven",
                                  color: Color.fromRGBO(1, 0, 53, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
                /* descriptionCardExtract(), */
                /* buyButtonInkwellExtract(), */
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack imageContainerExtract() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(9),
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(widget.productModel.image),
                  fit: BoxFit.contain)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(.4),
                  Colors.white.withOpacity(.2),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  InkWell buyButtonInkwellExtract() {
    return InkWell(
      onTap: () => debugPrint("Added to cart"),
      child: Container(
        margin: EdgeInsets.only(top: 40),
        height: 54,
        width: 355,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 228, 89, 57),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "BUY",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                '${widget.productModel.price}TL',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Card descriptionCardExtract() {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      child: SizedBox(
        width: 700,
        height: 200,
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              widget.productModel.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Container titleContainerExtract() {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              // ignore: deprecated_member_use
              textScaleFactor: 0.8,
              widget.productModel.title.toString().padRight(10),
              style: TextStyle(
                color: Color.fromRGBO(1, 0, 53, 1),
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
        ],
      )),
    );
  }

  void onRatingUpdate(double rating) {}
}
