import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/views/screens/scanBarcodeOne.dart';
import 'package:flutter/material.dart';
import '../core/models/productUploader.dart';
import '../core/views/screens/addProductScreen.dart';
import '../core/views/screens/allProductsScreen.dart';
import '../core/views/screens/productInfo.dart';
import '../core/views/screens/addProductImageBuilder.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/allProductionScreen':
        return MaterialPageRoute(builder: (ctx) => AllProductsScreen());
      case '/productInfo':
      Product product = settings.arguments as Product;
       return MaterialPageRoute(builder:(context) => ProductInfo(product:product,),settings:settings );
      case '/scanBarcodeOne':
        return MaterialPageRoute(builder: (ctx) => ScanBarcodeOne());
      case '/addProductScreen':
      String barcode = settings.arguments as String;
        return MaterialPageRoute(builder: (ctx) => AddProductScreen(barcode:barcode),settings:settings);
      case '/addProductImage':
       ProductUploader productUploader = settings.arguments as ProductUploader;
        return MaterialPageRoute(builder: (ctx) => AddProductImageBuilder(productUploader:productUploader,),settings:settings);
     
    }
  }
}