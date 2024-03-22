// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gorev_emre_hoca/model/product_model.dart';

class CategoryService {
  static const String url = "https://fakestoreapi.com/products";

  static Future<List<ProductModel>> getCategoryData() async {
    List<ProductModel> listeler = [];

    try {
      var result = await Dio().get(url);

      if (result.statusCode == 200) {
        var categoryList = result.data;

        debugPrint(
            "Raw API Response: $categoryList"); // Add this line for debugging

        if (categoryList is List) {
          listeler = categoryList
              .map((e) {
                debugPrint("Processing item $e"); // Add this line for debugging
                return ProductModel.fromJson(e);
              })
              .where((category) => category != null) // Filter out null values
              .cast<ProductModel>()
              .toList();

          debugPrint(
              "Parsed Category List: $listeler"); // Add this line for debugging
        }
      }
    } catch (e) {
      debugPrint("Error fetching category data: $e");
    }

    return listeler;
  }
}
