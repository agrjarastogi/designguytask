import 'dart:math';

import 'package:ecommerce/model/item_model.dart';

class CartModel {
  int id;
  int userId;
  String date;
  List<Map<String, int>> products;

  List<ItemModel>? items;

  static Map<String, int> mapOfProductToQuantity = {};

  CartModel(
      {required this.id,
      required this.userId,
      required this.date,
      this.products = const []}) {
    if (products.isNotEmpty) {
      populateMap();
    }
  }

  populateMap() {
    for (Map<String, int> data in products) {
      if (mapOfProductToQuantity.containsKey(data['productId'].toString())) {
        mapOfProductToQuantity[data['productId'].toString()] = max(
            data['quantity']??0,
            mapOfProductToQuantity[data['productId'].toString()]!.toInt());
      }
    }
  }

  static CartModel fromJson(Map data){
    return CartModel(id: data['id'], userId: data['userId'], date: data['date'], products: data['products']);
  }

  @override
  String toString() {
    return products.toString();
  }
}
