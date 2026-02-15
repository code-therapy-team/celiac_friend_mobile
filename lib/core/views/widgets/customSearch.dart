import 'package:celiac_mobile/core/constants/app_colors.dart';
import 'package:celiac_mobile/core/constants/text_styles.dart';
import 'package:celiac_mobile/core/views/widgets/searchBox.dart';
import 'package:celiac_mobile/core/views/widgets/suffixInSearchBox.dart';
import 'package:celiac_mobile/helper/cubits/search_product_cubit/search_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/debouncer.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  late Debouncer debouncer;
  @override
  void initState() {
    debouncer = Debouncer(milliseconds:500);
    super.initState();
  }
  @override
  void dispose() {
   debouncer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Box(
      color:AppColors.lightGrey, 
      hintStyle:AppTextStyle.searchWord, 
      hintText: 'بحث', 
      suffixIcon:SuffixInSearchBox(),
      onChanged:(value){
        if(value.isEmpty){
          debouncer.cancel();
          BlocProvider.of<SearchProductCubit>(context).clearSearch();
        }else{
          debouncer.run((){
            BlocProvider.of<SearchProductCubit>(context).searchProduct(name:value);
          });
        }
      } ,
      );
  }
}