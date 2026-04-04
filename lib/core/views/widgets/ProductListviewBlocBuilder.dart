import 'package:celus_fe/core/views/widgets/productListViewBuilder.dart';
import 'package:celus_fe/helper/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:celus_fe/helper/cubits/get_product_cubit/get_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListViewBlocBuilder extends StatelessWidget {
  const ProductListViewBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductState>(
       buildWhen: (previous, current) =>  current is! GetProductFromPaginationLoading && current is! ProductInitialState,
      builder:(context,state){
       if(state is ProductLoadedState) {
         return ProductListViewBuilder(products:state.products);
       } else if (state is ProductEmptyState) {
         return Center(child:  Text(state.message),);
       } else if (state is ProductErrorState){
         return Center(child:Text(state.errorMessage) ,);
      }
      else if( state is ProductLoadingState)
      {
        return Center(child:CircularProgressIndicator(),);
      }
       else {
        return Text('error');
      }
      },
  
      );
  }
} 