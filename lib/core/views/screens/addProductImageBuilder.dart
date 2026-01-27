import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helper/cubits/add_product_cubit/add_product_cubit.dart';
import '../../../helper/cubits/add_product_cubit/add_product_state.dart';
import '../../models/productUploader.dart';
import '../widgets/addProductImage.dart';
import '../widgets/bigStack.dart';
import '../widgets/doneAddProduc.dart';

class AddProductImageBuilder extends StatelessWidget {
  const AddProductImageBuilder({super.key, required this.productUploader});
final ProductUploader productUploader;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    body: BigStuck(
      widget: Padding(
        padding: EdgeInsets.only(right: 30, left: 30, top: 25),
        child: BlocProvider(
          create: (context) => AddProductCubit(),
          child: BlocBuilder<AddProductCubit, AddProductState>(
            builder: (context, state) {
              if (state is InitailAddProductState) {
                return AddProductImage(productUploader: productUploader);
              } else if (state is DoneAddProductState) {
                return DoneAddProduct(name:state.name ,);
              } else if (state is AddProductErrorState) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    ),
  );
       
        
  }
}