import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../../helper/error/failures.dart';

class AddProductVM {
  final Dio dio;
  AddProductVM(this.dio);
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ0NTY5OTU2LCJleHAiOjE3NDUxNzQ3NTZ9.awcws0YmdTW71QWv_3PINfeVqRMPQmVuynIXS7MjVtA';
  final ApiException apiException = ApiException();

  Future<Either<Failure,void>> postProduct(
      {required Map<String, dynamic> productUploaderData}) async {
    print('addVm $productUploaderData');
    FormData formData = FormData.fromMap(productUploaderData);
   // print(formData);
    try {
      final response = await dio.post(
        API_URL.allProductsUrl,
        data: formData,
        options: Options(
          headers: {
            'Authorization':'Bearer $token',
            'Content-Type': 'multipart/form-data'
          },
        ),
      );
      print(response);
      print("ok");
      return const Right(null);
    } catch (e) {
     
      return Left(ServerFailure.handleException(e));
    }
  }
}