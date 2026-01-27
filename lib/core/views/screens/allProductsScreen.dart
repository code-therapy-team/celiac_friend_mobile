import 'package:celus_fe/core/views/widgets/bigStack.dart';
import 'package:celus_fe/core/views/widgets/productListViewBuilder.dart';
import 'package:celus_fe/helper/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:celus_fe/helper/cubits/search_product_cubit/search_product_cubit.dart';
import 'package:celus_fe/helper/cubits/search_product_cubit/search_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helper/cubits/get_product_cubit/get_product_state.dart';
import '../../constants/text_styles.dart';
import '../widgets/ProductListviewBlocBuilder.dart';
import '../widgets/customSearch.dart';
import '../widgets/infoBar.dart';
import '../widgets/searchEmptWidget.dart';
import '../widgets/widgetLoadingPagination.dart';
class AllProductsScreen extends StatelessWidget {
   AllProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create:(context)=>ProductCubit()..gerProducts() // عشان نعمل tigger لل طلب وهي  اثناء تحميل ال صفحة
          ),
        BlocProvider<SearchProductCubit>(
          create:(context) => SearchProductCubit()
          )
      ],
      child: Scaffold(
        body: AllProductScreenBody(),
        bottomNavigationBar:BlocBuilder<ProductCubit,ProductState>(
              buildWhen: (previous, current) => current is GetProductFromPaginationLoading ||current is ProductLoadedState || current is ProductErrorState || current is ProductErrorPaginationState || current is ProductInitialState,
          builder:(context,state){
          if(state is GetProductFromPaginationLoading)
          {
            return WidgetLoadingPagination();
          }else if(state is ProductErrorPaginationState){
            return SafeArea(child: SizedBox(
            height: 60,
            child: Center(child:Text(state.errorMessage)),
          ),);
          }
          else{
            return SizedBox.shrink();
          }
        })
      ),
    );
  }
}

class AllProductScreenBody extends StatelessWidget {
  const AllProductScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BigStuck(widget:Padding(
        padding:EdgeInsets.only(right: 27,left: 27,bottom:40),
        child:Column(crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
          SizedBox(height: 30,),
          Text (
              'المنتجات',
              style:AppTextStyle.mainWord
              ),
              SizedBox(height: 39,),
              BlocBuilder<SearchProductCubit,SearchProductState>
              (builder: (context,state){
                if(state is SearchInitialState){
                return Column(
                  children: [
                    InfoBar(),
                    SizedBox(height: 32,),
                  ],
                );
                }else{
                return Container();
                }
              },),
             
          CustomSearch(),
          SizedBox(height: 14,),
         BlocBuilder<SearchProductCubit,SearchProductState>
         (builder:(context,state){
            if(state is SearchInitialState){
              return ProductListViewBlocBuilder();
            }else if(state is SearchLoadedState){
              return ProductListViewBuilder(products:state.products);
            }else if(state is SearchEmptyState){
                return Center(child:SearchEmptyWidget() ,);
            }else if(state is SearchErrorState){
                return Center(child:Text(state.errorMessage) ,);
            }else{
              return   Center(child:CircularProgressIndicator() ,);
            }
           
         })
        ],) ,
      )
      );
  }
}