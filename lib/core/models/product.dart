import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class Product {
  int? id;
  String productName;
  String barcode;
  int positiveVotes;
  int negativeVotes;
  String? imageURL;
  String? imageIngredientsURL;
  // XFile? imageURL;
  // XFile? imageIngredientsURL;
  int? alternatives;
  String? voteStatus;
  

  Product(
      {  this.id,
      required this.productName,
     required this.barcode,
      required this.positiveVotes,
      required  this.negativeVotes,
      this.imageURL,
      this.imageIngredientsURL,
      this.alternatives,
      this.voteStatus
      });

 factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id:json['id'],
    productName:json['productName'],
    barcode: json['barcode'],
    positiveVotes: json['positiveVotes'],
    negativeVotes:  json['negativeVotes'],
     imageURL:json['imageURL'], 
    imageIngredientsURL: json['imageIngredientsURL'] ,
    // imageURL:XFile(json['imageURL']), 
    // imageIngredientsURL: json['imageIngredientsURL'] != null ? XFile(json['imageIngredientsURL']) : null,
    alternatives: json['alternatives'],
    voteStatus:json ['voteStatus']
    );
    
  }

  Future <Map<String, dynamic>> toJson()async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['barcode'] = this.barcode;
    data['positiveVotes'] = this.positiveVotes;
    data['negativeVotes'] = this.negativeVotes;
    data['voteStatus']=this.voteStatus;
    data['imageURL'] = this.imageURL;
    data['imageIngredientsURL'] =this. imageIngredientsURL;
    // data['imageURL'] = await MultipartFile.fromFile(imageURL!.path);
    // if(imageIngredientsURL !=null)
    // data['imageIngredientsURL'] = await MultipartFile.fromFile(imageIngredientsURL!.path);
    data['alternatives'] = this.alternatives;
   
    return data;
  }
}