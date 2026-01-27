import 'package:flutter/widgets.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import 'customContainerDialog.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       Center(child:  Container(
                   height:45,
                   width: 45,
                  child:ClipRRect(
                    child:Image.asset('assets/images/NothingFound.png',fit:BoxFit.fill ,
                    ),
                  ) ,
                 ),),
                SizedBox(height: 5,),
            Center(child: Text('لم نعثر على هذا المنتج.',style:AppTextStyle.notFoundGrey ,),),
            SizedBox(height:10 ,),
            Center(child: Padding(
              padding:EdgeInsets.symmetric(horizontal:10 ) ,
              child: Text('يمكنك إضافة المنتج إلى قائمة المنتجات التي تحتاج إلى مشاركة معلومات من المستخدمين الآخرين',
              style:AppTextStyle.bold10_grey ,textAlign:TextAlign.center ,
              ),
            ),),
            SizedBox(height:15 ,),
          GestureDetector(child: const Center(
            child:CustomContainerDialog(height:29 ,width:150,text:'اسأل عن هذا المنتج' ,
            color: AppColors.notFoundGrey,textStyle:AppTextStyle.bold12_white) ,),
          onTap:(){Navigator.pushNamed(context,"/scanBarcodeOne", );} ,
         
            )
    ],);
  }
}