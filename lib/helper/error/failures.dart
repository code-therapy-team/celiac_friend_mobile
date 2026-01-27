import 'package:celus_fe/helper/error/exceptions.dart';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.handleException(Object e) {
    if (e is DioException) {
      final errorMessage = _mapDioErrorToMessage(e);
      return ServerFailure(errorMessage);
    }else if(e is ServerException){
        return ServerFailure(e.errorMessage);
    }
     else {
      return ServerFailure(
          """
$e

حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.
          
          """);
    }
  }

  static String _mapDioErrorToMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "انتهت مهلة الاتصال. يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.";
      case DioExceptionType.sendTimeout:
        return "انتهت مهلة الطلب أثناء إرسال البيانات. يرجى المحاولة مرة أخرى لاحقًا.";
      case DioExceptionType.receiveTimeout:
        return "انتهت مهلة الطلب أثناء استقبال البيانات. يرجى المحاولة مرة أخرى.";
      case DioExceptionType.badCertificate:
        return "حدث خطأ في الشهادة. يرجى التأكد من أن الاتصال آمن.";
      case DioExceptionType.badResponse:
        return _mapResponseErrorToMessage(e.response);
      case DioExceptionType.cancel:
        return "تم إلغاء الطلب. يرجى المحاولة مرة أخرى.";
      case DioExceptionType.connectionError:
        return "فشل في إنشاء الاتصال. يرجى التحقق من الشبكة والمحاولة مرة أخرى.";
      case DioExceptionType.unknown:
        return "حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.";
    }
  }

  static String _mapResponseErrorToMessage(Response? response) {
    if (response == null || response.statusCode == null) {
      return "There was an error. Please try again.";
    }
    //here, you should build the model
    switch (response.statusCode) {
      case 400:
        return "طلب غير صالح. يرجى التحقق من المدخلات.";
      case 401:
        return "غير مصرح. اسم المستخدم أو كلمة المرور غير صحيحة.";
      case 403:
        return "طلب مرفوض.";
      case 404:
        return "المورد غير موجود.";
      case 500:
        return "خطأ داخلي في الخادم. يرجى المحاولة لاحقاً.";
      default:
        return "استجابة غير صحيحة برمز الحالة: ${response.statusCode}";
    }
  }
}

class EmptyRemoteDataFailure extends Failure {
  EmptyRemoteDataFailure(super.errorMessage);
}
