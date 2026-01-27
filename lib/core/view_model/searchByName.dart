

import 'package:celus_fe/core/api/api_consumer.dart';
import 'package:celus_fe/core/api/end_ponits.dart';
import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../models/product.dart';

class SearchByNameVM{
  final ApiConsumer apiConsumer;
  SearchByNameVM({required this.apiConsumer});
  Future<Either<Failure, List<Product>>> get({required String name}) async {
    try {
      final response = await apiConsumer.get(
        "${EndPoint.searchByName}$name",
      );
      List<Product> products =
      response.map<Product>((item) => Product.fromJson(item)).toList();  
      return Right(products);
    } catch (e) {
      return Left(ServerFailure.handleException(e));
    }
  }
}

// import 'package:celus_fe/helper/error/failures.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import '../../helper/apiException.dart';
// import '../constants/api_urls.dart';
// import '../models/product.dart';
// class SearchByNameVM{
//   final Dio dio;
//   final ApiException apiException = ApiException();
//   SearchByNameVM(this.dio);
//   String token =
//       'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ4MTE2MjAyLCJleHAiOjE3NDg3MjEwMDJ9.YXhZ-v39qEMAPIR5vJS4lOYtASQwKhjb6igGitjxkNI';

//   Future<Either<Failure, List<Product>>> get({required name}) async {
//     try {
//       final response = await dio.get(
//         "${API_URL.searchByName}$name",
//         options: Options(
//           headers: {'Authorization': 'Bearer $token'},
//         ),
//       );
//       List productsList = response.data;
//       List<Product> products =
//       productsList.map((item) => Product.fromJson(item)).toList();  
//       return Right(products);
//     } catch (e) {
//       return Left(ServerFailure.handleException(e));
//     }
//   }
// }
