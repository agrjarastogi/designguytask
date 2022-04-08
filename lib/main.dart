import 'package:ecommerce/constants/colorModel.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/objectbox/objectbox.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';



late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key){
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.red,
        systemNavigationBarIconBrightness: Brightness.dark
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce Agrja',
      theme: ThemeData(
        colorScheme: colorSchemeLight
      ),
      home: const HomePage(),
    );
  }
}