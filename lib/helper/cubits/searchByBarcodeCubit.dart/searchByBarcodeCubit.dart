// import 'package:bloc/bloc.dart';
// import 'package:celiac_mobile/helper/cubits/get_product_cubit/get_product_state.dart';
// import 'package:celiac_mobile/helper/cubits/searchByBarcodeCubit.dart/searchByBarcodeStates.dart';
// import 'package:dio/dio.dart';

// import '../../../core/view_model/ProductByBarcodeVM.dart';

// class SearchBarCubit extends Cubit <SearchByBarcodeStates>{
//   SearchBarCubit():super(InitialSearchBarState());
// Future SearchBar({required String barcode,required ProductState productState})async
// {
//   emit(LoadingSearchBarState());
//   final result =await ProductByBarcodeVM(Dio()).get(barcode:barcode);
//   result!.fold((left) {
//    if(left !=null){
//         emit(FailureSearchBarState(errorMessage: left.errorMessage));
//    }else {
//     emit(NotFoundSearchBarState(BarCode:barcode));
//    }
//   },
//     (right){
//    emit(FoundSearchBarState(productState: productState));
//     }
//   );
// }

// }