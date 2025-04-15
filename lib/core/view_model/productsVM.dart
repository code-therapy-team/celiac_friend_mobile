import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../helper/apiException.dart';
import '../constants/api_urls.dart';
import '../models/product.dart';

class ProductsVM {
  final Dio dio;
  final ApiException apiException = ApiException();
  ProductsVM(this.dio);
  String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ0NTY5OTU2LCJleHAiOjE3NDUxNzQ3NTZ9.awcws0YmdTW71QWv_3PINfeVqRMPQmVuynIXS7MjVtA';
  
  // GET request
  Future<Either<Failure,List<Product>>> get() async {
    try {
      final response = await dio.get('${API_URL.allProductsUrl}',options: Options(
          headers:{'Authorization': 'Bearer $token'} ,
        ),
      );
      List productLst=response.data;
     List<Product> products =productLst.map((item) => Product.fromJson(item)).toList();
      return Right(products);
    } catch(e){
      print(e);
      return Left(ServerFailure.handleException(e));
    }
   
  }

  // POST request
  Future<dynamic> post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      String? token}) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : {},
        ),
      );
      return response.data;
    } on DioException catch (e) {
      apiException.handleError(e);
    } catch (e) {
      throw Exception('$e');
    }
  }

  // PUT request
  Future<dynamic> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      String? token}) async {
    try {
      final response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : {},
        ),
      );
      return response.data;
    } on DioException catch (e) {
     apiException.handleError(e);
    } catch (e) {
      throw Exception('$e');
    }
  }

  // DELETE request
  Future<dynamic> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      String? token}) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : {},
        ),
      );
      return response.data;
    } on DioException catch (e) {
      apiException.handleError(e);
    } catch (e) {
      throw Exception('$e');
    }
  }

  // PATCH request
  Future<dynamic> patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      String? token}) async {
    try {
      final response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : {},
        ),
      );
      return response.data;
    } on DioException catch (e) {
     apiException.handleError(e);
    } catch (e) {
      throw Exception('$e');
    }
  }

 
}