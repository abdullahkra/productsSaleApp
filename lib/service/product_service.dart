import 'package:dio/dio.dart';
import 'package:gorev_emre_hoca/model/product_model.dart';

class CategoryService {
  static const String url = "https://fakestoreapi.com/products";

  static Future<List<ProductModel>> getCategoryData() async {
    List<ProductModel> list = [];

    try {
      var result = await Dio().get(url);

      if (result.statusCode == 200) {
        var categoryList = result.data;

        print("Raw API Response: $categoryList"); // Add this line for debugging

        if (categoryList is List) {
          list = categoryList
              .map((e) {
                print(
                    "Processing item $e"); // Add this line for debugging
                return ProductModel.fromJson(e);
              })
              .where((category) => category != null) // Filter out null values
              .cast<ProductModel>()
              .toList();

          print(
              "Parsed Category List: $list"); // Add this line for debugging
        }
      }
    } catch (e) {
      print(
          "Error fetching category data: $e");
    }

    return list;
  }
}
