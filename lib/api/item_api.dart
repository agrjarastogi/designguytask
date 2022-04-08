import 'package:dio/dio.dart';

import '../model/item_model.dart';

List<ItemModel> allProduct = [];

Future<List<ItemModel>> fetchAllProducts() async {
  if(allProduct.isNotEmpty){
    return allProduct;
  }
  Dio dio = Dio();
  Response resp = await dio.get('https://fakestoreapi.com/products');
  if(resp.data!=null){
    for(Map data in resp.data){
      ItemModel itemModel = ItemModel.fromJson(data);
      allProduct.add(itemModel);
    }
    return allProduct;
  }
  return [];
}