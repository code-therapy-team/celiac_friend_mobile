import 'package:celus_fe/core/api/api_consumer.dart';
import 'package:celus_fe/core/api/end_ponits.dart';
import 'package:dartz/dartz.dart';
import '../../helper/error/failures.dart';

class AddProductVM {
  final ApiConsumer apiConsumer;
  AddProductVM(this.apiConsumer);

  Future<Either<Failure, String>> postProduct({
    required Map<String, dynamic> productUploaderData,
  }) async {
    print(productUploaderData);
    try {
      await apiConsumer.post(
        EndPoint.product,
        data: productUploaderData,
        isFromData: true,
      );
      print("ok ==================== ");
      return Right(productUploaderData['productName']);
    } catch (e,s) {
      print("error ==================== $e");
      print("error ==================== $s");
      print(ServerFailure.handleException(e).errorMessage);
      return Left(ServerFailure.handleException(e));
    }
  }
}
// import 'package:celus_fe/core/constants/api_urls.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import '../../helper/apiException.dart';
// import '../../helper/error/failures.dart';
// class AddProductVM{
//    final Dio dio;
//    AddProductVM(this.dio);
//     String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ4MTE2MjAyLCJleHAiOjE3NDg3MjEwMDJ9.YXhZ-v39qEMAPIR5vJS4lOYtASQwKhjb6igGitjxkNI';
//   final ApiException apiException = ApiException();

//   Future<Either<Failure, String>> postProduct({required Map<String,dynamic>productUploaderData})async{
//     print(productUploaderData);
//     try {
//        FormData formData = FormData.fromMap(productUploaderData);
//   final response = await dio.post(API_URL.allProductsUrl, 
//   data:formData, options: Options(
//         headers:{'Authorization': 'Bearer $token','Content-Type': 'multipart/form-data'}, 
//       ),);
//    print("ok");
//  return Right(productUploaderData['productName']);
//   }  catch (e) {
//   print(ServerFailure.handleException(e).errorMessage);
//   return Left(ServerFailure.handleException(e));
// }

//   }
 
// }