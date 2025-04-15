import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/view_model/addProductVM.dart';
import 'add_product_state.dart';
class AddProductCubit extends Cubit <AddProductState>{
  AddProductCubit():super(InitailAddProductState());

 addProduct( {required Map<String,dynamic> productUploaderData})async{
  emit(LoadingAddProductState());
 final result =await AddProductVM(Dio()).postProduct(productUploaderData:productUploaderData);
  result.fold((left) {
      emit(AddProductErrorState(errorMessage:left.errorMessage));
     // print('left');
    }, (right) {
       emit(DoneAddProductState());
      // print('right');
    });
 
 }
}