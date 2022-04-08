import 'package:ecommerce/model/UserInfo.dart';
import 'package:ecommerce/objectbox.g.dart';

class ObjectBox{
  late final Store store;
  late final Box<UserInfo> userBox;

  ObjectBox._create(this.store){
    userBox = Box<UserInfo>(store);
    addUserInfo();
  }


  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  addUserInfo(){
    userBox.put(UserInfo(cardNumber: '123', address: 'address', userName: "Agrja"));
  }
}