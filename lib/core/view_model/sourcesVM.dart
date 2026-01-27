import 'package:celus_fe/core/api/api_consumer.dart';
import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:celus_fe/core/models/choise.dart';

class SourceVM{
  final ApiConsumer apiConsumer;
  SourceVM({required this.apiConsumer});
  Future <List<ChoiseModel>> get()async{
   List<dynamic> response = await apiConsumer.get(API_URL.sourcesLookup);
   List<ChoiseModel> choise = response.map<ChoiseModel>((item) => ChoiseModel.fromJson(item)).toList();
   print(choise);
   return choise;
  }
}
// import 'package:celus_fe/core/constants/api_urls.dart';
// import 'package:celus_fe/core/models/choise.dart';
// import 'package:dio/dio.dart';

// import '../../helper/apiException.dart';

// class SourceVM{
//   final Dio dio;
//   SourceVM(this.dio);
//     String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ4MTE2MjAyLCJleHAiOjE3NDg3MjEwMDJ9.YXhZ-v39qEMAPIR5vJS4lOYtASQwKhjb6igGitjxkNI';
//   final ApiException apiException = ApiException();

//   Future <List<ChoiseModel>> get()async{
//    Response response = await dio.get(API_URL.sourcesLookup,options: Options(
//           headers:{'Authorization': 'Bearer $token'} ,
//         ),);
//         List<dynamic>data = response.data;
//    List<ChoiseModel> choise = data.map((item) => ChoiseModel.fromJson(item)).toList() as List<ChoiseModel>;
//    print(choise);
//    return choise;
//   }
// }