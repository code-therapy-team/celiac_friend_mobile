import 'package:celus_fe/core/models/product.dart';

 class ProductState{}
 class ProductInitialState extends ProductState{}
 class ProductLoadingState extends ProductState{}
 class GetProductFromPaginationLoading extends ProductState{}
 class ProductLoadedState extends ProductState{
  final List<Product> products;
  ProductLoadedState({required this.products});
}
 class ProductEmptyState extends ProductState{
  final String message='No products found';
}
 class ProductErrorState extends ProductState{
  final String errorMessage;
  ProductErrorState({required this.errorMessage});
}
class ProductErrorPaginationState  extends ProductState{
  final String errorMessage;
  ProductErrorPaginationState({required this.errorMessage});
}
