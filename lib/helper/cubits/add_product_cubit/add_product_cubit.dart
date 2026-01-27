import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:celus_fe/core/services/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/view_model/addProductVM.dart';
import 'add_product_state.dart';
class AddProductCubit extends Cubit <AddProductState>{
  AddProductCubit():super(InitailAddProductState());

 Future<void> addProduct( {required Map<String,dynamic> productUploaderData})async{
  emit(LoadingAddProductState());
 final result =await AddProductVM(getIt<DioConsumer>()).postProduct(productUploaderData:productUploaderData);
  result.fold((left) {
      emit(AddProductErrorState(errorMessage: left.errorMessage));
    }, (right) {
       emit(DoneAddProductState(name:right));
    });
 
 }
}
// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../core/view_model/addProductVM.dart';
// import 'add_product_state.dart';
// class AddProductCubit extends Cubit <AddProductState>{
//   AddProductCubit():super(InitailAddProductState());

//  addProduct( {required Map<String,dynamic> productUploaderData})async{
//   emit(LoadingAddProductState());
//  final result =await AddProductVM(Dio()).postProduct(productUploaderData:productUploaderData);
//   result.fold((left) {
//       emit(AddProductErrorState(errorMessage: left.errorMessage));
//     }, (right) {
//        emit(DoneAddProductState(name:right));
//     });
 
//  }
// }