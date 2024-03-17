// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gorev_emre_hoca/model/product_model.dart';
import 'package:gorev_emre_hoca/screens/produc_details_page.dart';
import 'package:gorev_emre_hoca/service/product_service.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  late Future<List<ProductModel>> _categoryListFuture;

  @override
  void initState() {
    super.initState();
    _categoryListFuture = CategoryService.getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        title: Text(
          "All Products",
          style: TextStyle(fontFamily: "Yeniyazi"),
        ),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _categoryListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
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

  Padding productsExtract(AsyncSnapshot<List<ProductModel>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(snapshot.data!.length, (index) {
          var products = snapshot.data![index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          productModel: products,
                        )),
              );
            },
            child: GridTile(
              child: Image.network(products.image),
              footer: GridTileBar(
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
                backgroundColor: Colors.black54,
                title: Text(products.category.toString()),
                subtitle: Text('\$${products.price.toString()}'),
              ),
            ),
          );
        }),
      ),
    );
  }
}
