import 'package:celus_fe/core/constants/app_colors.dart';
import 'package:celus_fe/core/views/widgets/bigStack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/text_styles.dart';
import '../../models/productUploader.dart';
import '../widgets/customContainerDialog.dart';
import '../widgets/searchBox.dart';
class AddProductScreen extends StatelessWidget {
   AddProductScreen({super.key,required this.barcode});
   final String barcode;
  @override
  final TextEditingController nameProductCt = TextEditingController();
  final TextEditingController brandProductCt = TextEditingController();
  final TextEditingController countryProductCt = TextEditingController();
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:BigStuck(widget:Padding
      (padding:EdgeInsets.only(right:30,left: 30,top:25 ,),
       child:ListView(
        padding: EdgeInsets.only(bottom:200),
        children: [
           Text('إضافة منتج', style:AppTextStyle.mainWord ,),
            SizedBox(height:30),
        Center(
          child: Container(
                 height:120,
                 width: 100,
                child:ClipRRect(
                  child:SvgPicture.asset('assets/images/noun-tag-5413005.svg',fit:BoxFit.fill ,
                  color:Colors.red ,matchTextDirection:true,alignment:Alignment.centerRight ,
                  ),
                ) ,
               ),
        ),
        Center(child:Text('الخطوة ٢: اسم المنتج',style:AppTextStyle.bold14 ,)),
        SizedBox(height:15 ,),
        Center(child:Text('ما اسم هذا المنتج؟',style:AppTextStyle.bold12_mediemGrey ,)),
         SizedBox(height:14 ,),
        Box(color:AppColors.greyBox, hintStyle:AppTextStyle.bold12_mediemGrey,
         hintText: 'مثال: خبز توست', controler:nameProductCt,),
        SizedBox(height:20 ,),
        Center(child:Text('ما هي العلامة التجارية هذا المنتج؟',style:AppTextStyle.bold12_mediemGrey ,)),
         SizedBox(height:14 ,),
        Box(color:AppColors.greyBox, hintStyle:AppTextStyle.bold12_mediemGrey,
         hintText: 'مثال: المراعي', controler: brandProductCt,),
         SizedBox(height:20 ,),
        Center(child:Text('ما هو بلد الصنع؟',style:AppTextStyle.bold12_mediemGrey ,)),
         SizedBox(height:14 ,),
        Box(color:AppColors.greyBox, hintStyle:AppTextStyle.bold12_mediemGrey,
         hintText: 'مثال: تايلند', controler:countryProductCt,),
          SizedBox(height:20 ,),
          GestureDetector(
            child: SizedBox(
              height:29 ,
              width:100 ,
              child: CustomContainerDialog(
              height:29 ,
              width:145 ,
              text:'التالي',color:AppColors.darkBlue ,textStyle:AppTextStyle.bold14_white
              ),
            ),
            onTap:(){
              ProductUploader productUploader=ProductUploader(
                productName:nameProductCt.text, 
                brandName: brandProductCt.text, 
                manufacturerCountry:countryProductCt.text, 
                barcode: barcode);
                print(productUploader.productName);
                print(productUploader.barcode);
                print(productUploader.manufacturerCountry);
                print(productUploader.brandName);
               Navigator.pushNamed(context, "/addProductImage",arguments:productUploader );
            } ,
          )
       ],)
      ),
     
       ) ,
    );
  }
}