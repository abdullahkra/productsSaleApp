// ignore_for_file: sort_child_properties_last, prefer_const_constructors

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

  @override
  void initState() {
    super.initState();
    _categoryListFuture = CategoryService.getCategoryData();
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
          style: TextStyle(fontFamily: 'Yeniyazi'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'view all',
              style: TextStyle(color: Colors.brown),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _categoryListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: categoriesExtract(),
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
                          style:
                              TextStyle(fontFamily: "Yeniyazi", fontSize: 20),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllProducts(),
                              ),
                            );
                          },
                          child: Text(
                            "All Products",
                            style: TextStyle(color: Colors.brown),
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
                      fontFamily: "Yeniyazi",
                      color: Colors.black,
                      fontSize: 18),
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
        children: List.generate(4, (index) {
          var products = snapshot.data![index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(productModel: products,)),
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
                leading: Text(products.id.toString()),
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
