import 'package:celiac_mobile/helper/cubits/get_product_cubit/get_product_state.dart';

class SearchByBarcodeStates{}
class InitialSearchBarState extends SearchByBarcodeStates{}
class LoadingSearchBarState extends SearchByBarcodeStates{}
class FoundSearchBarState extends SearchByBarcodeStates{
  ProductState productState;
  FoundSearchBarState({required this.productState});
}
class NotFoundSearchBarState extends SearchByBarcodeStates{
  String BarCode;
  NotFoundSearchBarState({required this.BarCode});
}
class FailureSearchBarState extends SearchByBarcodeStates{
  final String errorMessage;
  FailureSearchBarState({required this.errorMessage});
}