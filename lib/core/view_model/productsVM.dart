import 'package:celus_fe/core/api/api_consumer.dart';
import 'package:celus_fe/core/api/end_ponits.dart';
import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../models/product.dart';

class ProductsVM {
  final ApiConsumer apiConsumer;
  ProductsVM({required this.apiConsumer});
  Future<Either<Failure, List<Product>>> get({required int pageNumber}) async {
    try {
      // List<dynamic> response = await apiConsumer.get(EndPoint.product);
      // final response = await apiConsumer.get(EndPoint.product,queryParameters: {'page':pageNumber});
      final response = await apiConsumer.get('${EndPoint.product}?page=$pageNumber');
      if (response.isEmpty) {
        return Left(EmptyRemoteDataFailure('there is no products'));
      }
      List<Product> products = response
          .map<Product>((item) => Product.fromJson(item))
          .toList();
      return Right(products);
    } catch (e,stackTrace) {
      print(e);
      print(stackTrace);
      return Left(ServerFailure.handleException(e));
    }
  }
}

// import 'package:celus_fe/helper/error/exceptions.dart';
// import 'package:celus_fe/helper/error/failures.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import '../../helper/apiException.dart';
// import '../models/product.dart';

// class ProductsVM {
//   final Dio dio;
//   final ApiException apiException = ApiException();
//   ProductsVM(this.dio);
//   String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ4MTE2MjAyLCJleHAiOjE3NDg3MjEwMDJ9.YXhZ-v39qEMAPIR5vJS4lOYtASQwKhjb6igGitjxkNI';
  
//   // GET request
//   Future<Either<Failure,List<Product>>> get({required int pageNumber}) async {
//     try {
//       final response = await dio.get('http://152.53.32.75:8000/api/product?page=$pageNumber',options: Options(
//           headers:{'Authorization': 'Bearer $token'} ,),);
//        print(pageNumber);
//       List productLst =response.data;
//       if(productLst.isEmpty){
//         throw ServerException('No More Data');
//       }
//   List<Product> products =productLst.map((item) => Product.fromJson(item)).toList();
//    return Right(products);
 
//     } catch(e){
//       print('e = $e');
//       return Left(ServerFailure.handleException(e));
//     }
   
//   }
// int checkUserProductVote({required Product product})
// {
  
//    return 0;
  
// }
//   // POST request
// }