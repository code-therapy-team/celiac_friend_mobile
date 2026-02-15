import 'package:celiac_mobile/core/models/product.dart';

sealed class SearchProductState {}
class SearchInitialState extends SearchProductState {}
class SearchLoadingState extends SearchProductState {}
class SearchLoadedState extends SearchProductState {
  final List<Product> products;
  SearchLoadedState({required this.products});
}
class SearchEmptyState extends SearchProductState {
  
}
class SearchErrorState extends SearchProductState {
  final String errorMessage;
  SearchErrorState({required this.errorMessage});
}
