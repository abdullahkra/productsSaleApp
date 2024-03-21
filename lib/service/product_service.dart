import 'package:dio/dio.dart';
import 'package:gorev_emre_hoca/model/product_model.dart';

class CategoryService {
  static const String url = "https://fakestoreapi.com/products";

  static Future<List<ProductModel>> getCategoryData() async {
    List<ProductModel> listeler = [];

    try {
      var result = await Dio().get(url);

      if (result.statusCode == 200) {
        var categoryList = result.data;

        print("Raw API Response: $categoryList"); // Add this line for debugging

        if (categoryList is List) {
          listeler = categoryList
              .map((e) {
                print("Processing item $e"); // Add this line for debugging
                return ProductModel.fromJson(e);
              })
              .where((category) => category != null) // Filter out null values
              .cast<ProductModel>()
              .toList();

          print("Parsed Category List: $listeler"); // Add this line for debugging
        }
      }
    } catch (e) {
      print("Error fetching category data: $e");
    }

    return listeler;
  }
}
