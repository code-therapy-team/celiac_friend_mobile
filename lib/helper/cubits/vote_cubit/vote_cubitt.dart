import 'package:bloc/bloc.dart';
import 'package:celiac_mobile/core/api/dio_consumer.dart';
import 'package:celiac_mobile/core/services/get_it.dart';
import 'package:celiac_mobile/helper/cubits/vote_cubit/vote_states.dart';

import '../../../core/view_model/votingVM.dart';

class VoteCubit extends Cubit<VoteStates>{
  VoteCubit():super(NoVoteState());
  Future<void> addVote({required int productBarcode,required Map<String,int>voteData})async{
    emit(LoadingState());
    final result = await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode: productBarcode, voteData: voteData);
    result.fold((left){
     emit(ErrorState(errorMessage:left.errorMessage));
    },(r){
     
    });
  }

}