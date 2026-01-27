import 'dart:io';

import 'package:celus_fe/helper/image_compress.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ProductUploader {
  String productName;
  String barcode;
  String manufacturerCountry;
  String brandName;
  XFile? productImage;
  XFile? ingredientsImage;

  ProductUploader({
    required this.productName,
    required this.brandName,
    required this.manufacturerCountry,
    required this.barcode,
    this.ingredientsImage,
    this.productImage,
  });
  // factory ProductUploader.fromJson(Map<String, dynamic> json) {
  //   return ProductUploader(
  //     productName: json['productName'],
  //     brandName: json['brandName'],
  //     manufacturerCountry: json['ManufacturerCountry'],
  //     barcode: json['barcode'],
  //     productImage: XFile(json['productImage']),
  //     ingredientsImage: json['ingredientsImage'] == null
  //         ? null
  //         : XFile(json['ingredientsImage']),
  //   );
  // }
  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['brandName'] = brandName;
    data['ManufacturerCountry'] = manufacturerCountry;
    data['barcode'] = barcode;
    File compressed = await compressImage(File(productImage!.path));
    data['productImage'] = await MultipartFile.fromFile(
      compressed.path,
      filename: "product_${DateTime.now().millisecondsSinceEpoch}.jpg",
    );

    // data['productImage'] = await MultipartFile.fromFile(
    //   productImage!.path,
    //   filename: productImage!.name,
    // );
    // if (ingredientsImage == null) {
    //   // send empty multipart field
    //   data['ingredientsImage'] = "";
    // } else {
    //   data['ingredientsImage'] = await MultipartFile.fromFile(
    //     ingredientsImage!.path,
    //     filename: ingredientsImage!.name,
    //   );
    // }

    // data['ingredientsImage'] = ingredientsImage?.path!=null ? await MultipartFile.fromFile (ingredientsImage!.path):null;
    return data;
  }
}
