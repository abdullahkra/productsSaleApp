// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import, unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:gorev_emre_hoca/model/product_model.dart';
import 'package:gorev_emre_hoca/service/product_service.dart';

class DetailsPage extends StatelessWidget {
  final ProductModel productModel;
  DetailsPage({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 220, 220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                titleContainerExtract(),
                imageContainerExtract(),
                descriptionCardExtract(),
                buyButtonInkwellExtract(),
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
                  image: NetworkImage(productModel.image),
                  fit: BoxFit.contain)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.white.withOpacity(.4),
                  Colors.white.withOpacity(.2),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                    height: 30,
                    child: InkWell(
                      onTap: () {},
                      child: Icon(Icons.favorite, color: Colors.red),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  InkWell buyButtonInkwellExtract() {
    return InkWell(
      onTap: () => print("Added to cart"),
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
                '${productModel.price}TL',
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
              productModel.description,
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
              productModel.title.toString().padRight(10),
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
}
