import 'package:flutter/material.dart';
import 'package:profile/ui/screens/home_page.dart';
import 'package:get/get.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
 /*      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.onGenerateRoute, */
      home:HomeScreen() ,
    );
  }
}
