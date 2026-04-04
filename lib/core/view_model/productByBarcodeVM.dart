import 'package:celus_fe/core/api/api_consumer.dart';
import 'package:celus_fe/core/api/end_ponits.dart';
import 'package:celus_fe/core/models/productState.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart'as foundation;
import 'package:flutter/material.dart';
import '../../helper/error/failures.dart';
import '../constants/app_colors.dart';
import '../constants/text_styles.dart';

class ProductByBarcodeVM {
  final ApiConsumer apiConsumer;
  ProductByBarcodeVM({required this.apiConsumer});

  Future<Either<Failure, ProductState>> get({required barcode}) async {
    try {
      final response = await apiConsumer.get(
        "${EndPoint.productByBarcode}$barcode",
      );

      ProductState productState = ProductState.fromJson(response);
      if (foundation.kDebugMode) {
        print(productState.imageURL??''+'====================================');
      }
      return Right(productState);
    } catch (e) {
      print(e.toString()+'====================================');
      print(ServerFailure.handleException(e).errorMessage);
      return Left(ServerFailure.handleException(e));
    }
  }
  Map<String, dynamic> checkState({required productSafetyStatus}) {
    Map<String, dynamic> mapInfo = {};
    switch (productSafetyStatus) {
      case 'MARKED_AS_UNSAFE':
        {
          mapInfo['state'] = 'هذا المنتج موسوم كغير آمن';
          mapInfo['textStyle'] = AppTextStyle.bold14_red;
          mapInfo['colorIcon'] = AppColors.red;
          mapInfo['colorContainer'] = AppColors.pinck;
          mapInfo['icon'] = Icons.error;
          mapInfo['type'] = 1;
        }
        break;
      case 'MARKED_AS_SAFE':
        {
          mapInfo['state'] = 'هذا المنتج موسوم كآمن';
          mapInfo['textStyle'] = AppTextStyle.bold14_darkGreen;
          mapInfo['colorIcon'] = AppColors.darkGreen;
          mapInfo['icon'] = Icons.check_circle;
          mapInfo['colorContainer'] = AppColors.lightGreen;
          mapInfo['type'] = 2;
        }
        break;
      case 'UNSAFE':
        {
          mapInfo['state'] = 'هذا المنتج غير آمن';
          mapInfo['textStyle'] = AppTextStyle.bold14_red;
          mapInfo['colorIcon'] = AppColors.red;
          mapInfo['colorContainer'] = AppColors.pinck;
          mapInfo['icon'] = Icons.error;
          mapInfo['type'] = 3;
        }
        break;
      default:
        {
          mapInfo['state'] = 'لم نعثر على معلومات كافية حول هذا المنتج';
          mapInfo['textStyle'] = AppTextStyle.bold14_darkBlue;
          mapInfo['colorIcon'] = AppColors.darkBlue;
          mapInfo['colorContainer'] = AppColors.lightBlue;
          mapInfo['icon'] = Icons.help;
          mapInfo['type'] = 4;
        }
        break;
    }
    return mapInfo;
  }

  String checkType({
    required int type,
    required int positiveVotes,
    required int negativeVotes,
  }) {
    switch (type) {
      case 1:
        return '$negativeVotes مستخدمين أبلغوا أن هذا المنتج يحتوي على الجلوتين كأحد المكونات';
      case 2:
        return '$positiveVotes مستخدمين أبلغوا أن هذا المنتج يحتوي على الجلوتين كأحد المكونات';
      case 3:
        return 'تم العثور على الجلوتين ضمن مكونات هذا المنتج';
      default:
        return '';
    }
  }
}
// import 'package:celus_fe/core/constants/api_urls.dart';
// import 'package:celus_fe/core/models/productState.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../../helper/apiException.dart';
// import '../../helper/error/failures.dart';
// import '../constants/app_colors.dart';
// import '../constants/text_styles.dart';

// class ProductByBarcodeVM {
//   final Dio dio;
//   final ApiException apiException = ApiException();
//   ProductByBarcodeVM(this.dio);
//   String token =
//       'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ4MTE2MjAyLCJleHAiOjE3NDg3MjEwMDJ9.YXhZ-v39qEMAPIR5vJS4lOYtASQwKhjb6igGitjxkNI';

//   Future<ProductState> get({required barcode}) async {
//     try {
//       final response = await dio.get(
//         "${API_URL.productByBarcode}$barcode",
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       var data = response.data;
//       ProductState productState = ProductState(
//         contributionCount: data['contributionCount'],
//         productSafetyStatus: data['productSafetyStatus'],
//         imageURL: data['imageURL'],
//         productName: data['productName'],
//       );
//       print(productState.imageURL);
//       return productState;
//     } catch (e) {
//       print(ServerFailure.handleException(e).errorMessage);
//       throw ServerFailure.handleException(e);
//     }
//   }

//   Map<String, dynamic> checkState({required productSafetyStatus}) {
//     Map<String, dynamic> mapInfo = {};
//     switch (productSafetyStatus) {
//       case 'MARKED_AS_UNSAFE':
//         {
//           mapInfo['state'] = 'هذا المنتج موسوم كغير آمن';
//           mapInfo['textStyle'] = AppTextStyle.bold14_red;
//           mapInfo['colorIcon'] = AppColors.red;
//           mapInfo['colorContainer'] = AppColors.pinck;
//           mapInfo['icon'] = Icons.error;
//           mapInfo['type'] = 1;
//         }
//         break;
//       case 'MARKED_AS_SAFE':
//         {
//           mapInfo['state'] = 'هذا المنتج موسوم كآمن';
//           mapInfo['textStyle'] = AppTextStyle.bold14_darkGreen;
//           mapInfo['colorIcon'] = AppColors.darkGreen;
//           mapInfo['icon'] = Icons.check_circle;
//           mapInfo['colorContainer'] = AppColors.lightGreen;
//           mapInfo['type'] = 2;
//         }
//         break;
//       case 'UNSAFE':
//         {
//           mapInfo['state'] = 'هذا المنتج غير آمن';
//           mapInfo['textStyle'] = AppTextStyle.bold14_red;
//           mapInfo['colorIcon'] = AppColors.red;
//           mapInfo['colorContainer'] = AppColors.pinck;
//           mapInfo['icon'] = Icons.error;
//           mapInfo['type'] = 3;
//         }
//         break;
//       default:
//         {
//           mapInfo['state'] = 'لم نعثر على معلومات كافية حول هذا المنتج';
//           mapInfo['textStyle'] = AppTextStyle.bold14_darkBlue;
//           mapInfo['colorIcon'] = AppColors.darkBlue;
//           mapInfo['colorContainer'] = AppColors.lightBlue;
//           mapInfo['icon'] = Icons.help;
//           mapInfo['type'] = 4;
//         }
//         break;
//     }
//     return mapInfo;
//   }

//   String checkType({
//     required int type,
//     required int positiveVotes,
//     required int negativeVotes,
//   }) {
//     switch (type) {
//       case 1:
//         return '$negativeVotes مستخدمين أبلغوا أن هذا المنتج يحتوي على الجلوتين كأحد المكونات';
//       case 2:
//         return '$positiveVotes مستخدمين أبلغوا أن هذا المنتج يحتوي على الجلوتين كأحد المكونات';
//       case 3:
//         return 'تم العثور على الجلوتين ضمن مكونات هذا المنتج';
//       default:
//         return '';
//     }
//   }
// }
