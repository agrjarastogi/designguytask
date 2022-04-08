import 'package:ecommerce/model/UserInfo.dart';

class Helpers {

  static Future<int> insert(UserInfo person) async {
    return 0;
  }

  static Future<bool> delete(UserInfo id) async {
    return true;
  }

  static Future<UserInfo> queryPerson(UserInfo id) async {
    return UserInfo(cardNumber: '1', address: '1', userName: '1');
  }
}