import 'package:celiac_mobile/core/constants/app_colors.dart';
import 'package:celiac_mobile/core/constants/text_styles.dart';
import 'package:celiac_mobile/core/views/widgets/verticalLine.dart';
import 'package:flutter/material.dart';

import 'cotainerIcon.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      VerticalLine(height:22,),
      SizedBox(width:5 ,),
      
       ContainerIcon(backgroundIcon:AppColors.lightGreen, imagePath: 'assets/images/ok.png', containerH:22, containerW:22,
        imageH:16 ,imageW: 16,),
        SizedBox(width:5 ,),
       SizedBox(
        width: 45,
        height: 24,
         child: Text (
       'مناسب للسيلياك',
       style:AppTextStyle.bold8 
       ),
       ),
       VerticalLine(height:22,),
        SizedBox(width:5 ,),
        ContainerIcon(backgroundIcon:AppColors.pinck, imagePath: 'assets/images/ok.png', containerH:22, containerW:22,
         imageH:16 ,imageW: 16,),
         SizedBox(width:5 ,),
         SizedBox(
        width: 37,
        height: 24,
         child: Text (
       'غير مناسب للسيلياك',
       style:AppTextStyle.bold8 
       ),
       ),
    ],);
  }
}