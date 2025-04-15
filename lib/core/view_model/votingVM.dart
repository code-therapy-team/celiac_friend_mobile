import 'package:celus_fe/core/constants/api_urls.dart';
import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class VotingVM{
   final Dio dio;
   VotingVM(this.dio);
    String token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvbWVyIiwiaWF0IjoxNzQ0NTY5OTU2LCJleHAiOjE3NDUxNzQ3NTZ9.awcws0YmdTW71QWv_3PINfeVqRMPQmVuynIXS7MjVtA';

 Future<Either<Failure,void>> postVote({required int productId,required Map<String,int>voteData})async{
    try {
  final response = await dio.post('${API_URL.allProductsUrl}/$productId/${API_URL.vote}', data:voteData, options: Options(
        headers:{'Authorization': 'Bearer $token'} ,
      ),);
  print(response);
  print('ok');
  return Right(null);
} on Exception catch (e) {
  print(ServerFailure.handleException(e).errorMessage);
 return Left(ServerFailure.handleException(e));
}

  }
  Map<String,int> voteData({required int contributionDecision,required int reasonId,required int sourceId }){
    Map<String,int> voteInfo={};
    voteInfo['contributionDecision']=contributionDecision;
    voteInfo['reasonId']=reasonId;
    voteInfo['sourceId']=sourceId;
    return voteInfo;
  }
}