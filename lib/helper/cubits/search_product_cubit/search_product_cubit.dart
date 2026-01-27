import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:celus_fe/core/services/get_it.dart';
import 'package:celus_fe/core/view_model/searchByName.dart';
import 'package:celus_fe/helper/cubits/search_product_cubit/search_product_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit() : super(SearchInitialState());
  searchProduct({required String name}) async {
    emit(SearchLoadingState());
    final result = await SearchByNameVM(apiConsumer: getIt<DioConsumer>(),).get(name: name);
    result.fold((failure) {
      emit(SearchErrorState(errorMessage: failure.errorMessage));
    }, (products) {
      if (products.isEmpty) {
        emit(SearchEmptyState());
      } else {
        emit(SearchLoadedState(products: products));
      }
    });
  }
  clearSearch() {
    emit(SearchInitialState());
  }
}

// class SearchProductCubit extends Cubit<SearchProductState> {
//   SearchProductCubit() : super(SearchInitialState());
//   searchProduct({required String name}) async {
//     try {
//       emit(SearchLoadingState());
//       List<Product> products = await SearchByNameVM(Dio()).get(name: name);
//       if (products.isEmpty) {
//         emit(SearchEmptyState());
//       } else {
        
//         emit(SearchLoadedState(products: products));
//       }
//     } on Exception catch (e) {
//       emit(SearchErrorState(errorMessage: "there is something wrong"));
//     }
//   }
//   clearSearch() {
//     emit(SearchInitialState());
//   }
// }
