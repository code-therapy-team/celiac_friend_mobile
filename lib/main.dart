import 'package:celus_fe/core/view_model/addProductVM.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/view_model/searchByName.dart';
import 'core/view_model/votingVM.dart';
import 'helper/appRoute.dart';

void main()async {
 await AddProductVM(Dio()).postProduct(productUploaderData:{'productName':' شوكلاته', 'brandName':' جالكسي',
  ' manufacturerCountry':' السعودية' , 'barcode': '6294001816942', 
  'productImage':'assets/images/image 1.png',' ingredientsImage': 'assets/images/image 1.png'});
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         locale: const Locale('ar'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        debugShowCheckedModeBanner: false,
     // home:AllProductsScreen() ,
      initialRoute: '/allProductionScreen',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}