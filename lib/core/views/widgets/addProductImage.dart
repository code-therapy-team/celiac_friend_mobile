import 'dart:io';

import 'package:celus_fe/core/views/widgets/customContainrtWithWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../helper/cubits/add_product_cubit/add_product_cubit.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../models/productUploader.dart';
import '../../view_model/addProductVM.dart';
import 'customContainerDialog.dart';
import 'dialogImage.dart';

// class AddProductImage extends StatelessWidget {
//   const AddProductImage({super.key,required this.productUploader});
// final ProductUploader productUploader;
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//           padding: EdgeInsets.only(bottom: 200,left:20,right:20),
//           children: [
//            Text('إضافة منتج', style:AppTextStyle.mainWord ,),
//             SizedBox(height:30),
//         Center(
//           child: Container(
//                  height:120,
//                  width: 100,
//                 child:ClipRRect(
//                   child:SvgPicture.asset('assets/images/noun-camera-camera-7163557.svg',fit:BoxFit.fill ,
//                   color:Color(0xff5e35b1) ,matchTextDirection:true,alignment:Alignment.centerRight ,
//                   ),
//                 ) ,
//                ),
//         ),
//         SizedBox(height:25 ,),
//         Center(child: Text('الخطوة 3: صورة المنتج',style:AppTextStyle.bold14 ,)),
//         SizedBox(height:15 ,),
//         Center(child:Text('الصورة سوف تساعد المستخدمين في التعرف على المنتج ',
//             style:AppTextStyle.bold12_mediemGrey ,
//             textAlign:TextAlign.center ,),
//         ),
//         SizedBox(height: 25,),
//         Center(child:GestureDetector(
//           child: CustomContainerDialog(
//             height:29 ,
//             width:183 ,
//             text:' التقط صورة للمنتج',color:AppColors.darkBlue ,textStyle:AppTextStyle.bold14_white),
//             onTap: ()async{
//              XFile? productImage =await dialogImage(context);
//              if(productImage != null){
//                   productUploader.productImage=productImage;
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('تم اختيار صورة'),
//                   duration: Duration(seconds: 2),
//                   ),
//                 );
//                }
//               },
//         ) ,
//           ),
//           SizedBox(height:12,),
//         Center(child:GestureDetector(
//           child: CustomContainerDialog(
//             height:29 ,
//             width:183,
//             text:'التقط صورة للمكونات',color:AppColors.darkBlue ,textStyle:AppTextStyle.bold14_white),
//             onTap: ()async{
//              XFile? ingredientsImage =await dialogImage(context);
//              if(ingredientsImage != null){
//                   productUploader.ingredientsImage=ingredientsImage;
//                  ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('تم اختيار صورة'),
//                   duration: Duration(seconds: 2),
//                   ),
//                 );
//                }
//               },
//         ) ,
//           ),
//         SizedBox(height: 34,),
//         Center(
//           child: GestureDetector(
//             child: CustomContainerDialog(
//               color:AppColors.darkBlue  , 
//               height: 29, 
//               text: 'حفظ', 
//               textStyle: AppTextStyle.bold14_white, 
//               width:100,),
//             onTap: ()async{
//               Map<String,dynamic> productUploaderData=await productUploader.toJson();
//              // print(productUploaderData);
//             // await AddProductVM(Dio()).postProduct(productUploaderData:productUploaderData);
//             BlocProvider.of<AddProductCubit>(context).addProduct(productUploaderData: productUploaderData);
             
             
//             },
//           ),
//         )
//         ],);
//   }
// }

class AddProductImage extends StatefulWidget {
  const AddProductImage({super.key,required this.productUploader});
final ProductUploader productUploader;

  @override
  State<AddProductImage> createState() => _AddProductImageState();
}

class _AddProductImageState extends State<AddProductImage> {
   XFile? productImage;
  @override
  Widget build(BuildContext context) {
    return ListView(
          padding: EdgeInsets.only(bottom: 200,left:20,right:20),
          children: [
           Text('إضافة منتج', style:AppTextStyle.mainWord ,),
            SizedBox(height:30),
        Center(
          child: SizedBox(
                 height:120,
                 width: 100,
                child:ClipRRect(
                  child:SvgPicture.asset('assets/images/noun-camera-camera-7163557.svg',fit:BoxFit.fill ,
                  color:Color(0xff5e35b1) ,matchTextDirection:true,alignment:Alignment.centerRight ,
                  ),
                ) ,
               ),
        ),
        SizedBox(height:25 ,),
        Center(child: Text('الخطوة 3: صورة المنتج',style:AppTextStyle.bold14 ,)),
        SizedBox(height:15 ,),
        Center(child:Text('الصورة سوف تساعد المستخدمين في التعرف على المنتج ',
            style:AppTextStyle.bold12_mediemGrey ,
            textAlign:TextAlign.center ,),
        ),
        SizedBox(height: 25,),
        productImage == null?
        Center(child:GestureDetector(
          child: CustomContainerDialog(
            height:29 ,
            width:183 ,
            text:' التقط صورة للمنتج',color:AppColors.darkBlue ,textStyle:AppTextStyle.bold14_white),
            onTap: ()async{
              productImage =await dialogImage(context);
             if(productImage != null){
                  widget.productUploader.productImage=productImage;
                  setState(() {
                    
                  });
               }
              },
        ) ,
          ):
          Center(child: CustomContainer(
            colorBorder: AppColors.darkBlue ,
             colorContainer:Colors.white,
              widget:Row(children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                 height:90,
                child:ClipRRect(
                   borderRadius: BorderRadius.circular(16),
                  child:Image.file(File(productImage!.path),fit:BoxFit.fill ,),
                ) ,
                           ),
              ),
             SizedBox(width:5,),
             Expanded(
              flex: 2,
              child: Text('صورة المنتج',style:AppTextStyle.bold14 ,)),
             
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed:(){
                    productImage=null;
                    setState(() {
                      
                    });
                  }, 
                  icon:Icon(
                    Icons.delete_forever_outlined,
                    color:Colors.red ,
                    size: 30,)),
              )
              ],), radius: 12, paddinHorizental:10, paddingVertical:10,),),
       
        SizedBox(height: 34,),
        productImage !=null?
        Center(
          child: GestureDetector(
            child: CustomContainerDialog(
              color:AppColors.darkBlue  , 
              height: 29, 
              text: 'حفظ', 
              textStyle: AppTextStyle.bold14_white, 
              width:100,),
            onTap: ()async{
              Map<String,dynamic> productUploaderData=await widget.productUploader.toJson();
            BlocProvider.of<AddProductCubit>(context).addProduct(productUploaderData: productUploaderData);
            },
          ),
        ):SizedBox()
        ],);
  }
}