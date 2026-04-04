import 'package:celus_fe/core/api/api_consumer.dart';
import 'package:celus_fe/core/api/end_ponits.dart';
import 'package:celus_fe/core/models/choise.dart';

class ReasonsVM{
  final ApiConsumer apiConsumer;
  ReasonsVM({required this.apiConsumer});
  Future <List<ChoiseModel>> get()async{
   List<dynamic> response = await apiConsumer.get(EndPoint.reasonsLookup);  
   List<ChoiseModel> choise = response.map<ChoiseModel>((item) => ChoiseModel.fromJson(item)).toList();
   return choise;
  }
}

// import 'package:celus_fe/core/constants/api_urls.dart';
// import 'package:celus_fe/core/models/choise.dart';
// import 'package:dio/dio.dart';

// import '../../helper/apiException.dart';

// class ReasonsVM{
//   final Dio dio;
//   ReasonsVM(this.dio);
//     String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ4MTE2MjAyLCJleHAiOjE3NDg3MjEwMDJ9.YXhZ-v39qEMAPIR5vJS4lOYtASQwKhjb6igGitjxkNI';
//   final ApiException apiException = ApiException();

//   Future <List<ChoiseModel>> get()async{
//    Response response = await dio.get(API_URL.reasonsLookup,options: Options(
//           headers:{'Authorization': 'Bearer $token'} ,
//         ),);
       
//         List<dynamic>data = response.data;
//    List<ChoiseModel> choise = data.map((item) => ChoiseModel.fromJson(item)).toList() as List<ChoiseModel>;
  
//    return choise;
//   }
// }