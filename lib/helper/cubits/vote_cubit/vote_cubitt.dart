import 'package:bloc/bloc.dart';
import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:celus_fe/core/services/get_it.dart';
import 'package:celus_fe/helper/cubits/vote_cubit/vote_states.dart';

import '../../../core/view_model/votingVM.dart';

class VoteCubit extends Cubit<VoteStates>{
  VoteCubit():super(NoVoteState());
  addVote({required int productBarcode,required Map<String,int>voteData})async{
    emit(LoadingState());
    final result = await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode: productBarcode, voteData: voteData);
    result.fold((left){
     emit(ErrorState(errorMessage:left.errorMessage));
    },(r){
     
    });
  }

}