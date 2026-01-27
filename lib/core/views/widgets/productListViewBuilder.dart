import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/cubits/get_product_cubit/get_product_cubit.dart';
import '../../models/product.dart';
import 'customProductUI.dart';

class ProductListViewBuilder extends StatelessWidget {
  const ProductListViewBuilder({super.key, required this.products});
final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Expanded(
                child: NotificationListener<ScrollNotification>(
                   onNotification:(notification){
              if(notification.metrics.pixels== notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
          ProductCubit cubit = BlocProvider.of(context);
          cubit.gerProducts(fromLoading: true);
              }
         return true;
          } ,
                  child: ListView.builder(
                    padding:EdgeInsets.only(bottom:70 ) ,
                    itemCount:products.length,
                    itemBuilder:(con,i){
                    return CustomProductUI(product:products[i],);
                              }),
                ),
              );
  }
}