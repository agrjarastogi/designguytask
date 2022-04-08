import 'package:dio/dio.dart';

import '../model/cart_model.dart';

CartModel cart = CartModel(date: '10:00:00',id: -1,userId: 100,products: []);

Future<CartModel> fetchAllCart() async {
  if(cart.id != -1){
    return cart;
  }
  Dio dio = Dio();
  Response resp = await dio.get('https://fakestoreapi.com/carts/1');
  if(resp.data!=null){
    return CartModel.fromJson(resp.data);
  }
  return cart;
}