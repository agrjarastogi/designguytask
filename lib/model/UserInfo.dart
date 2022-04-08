import 'package:objectbox/objectbox.dart';

@Entity()
class UserInfo{
  String cardNumber;
  String address;
  String userName;
  int id;

  UserInfo({required this.cardNumber, required this.address, required this.userName,this.id = 0});
}
