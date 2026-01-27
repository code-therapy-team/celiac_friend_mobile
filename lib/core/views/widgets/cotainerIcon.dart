import 'package:celus_fe/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'customContainerDialog.dart';

class ContainerIcon extends StatelessWidget {
   ContainerIcon({super.key,required this.imagePath,required this.backgroundIcon,this.value,required this.containerH,
  required this.containerW,required this.imageH,required this.imageW
  });
 final String imagePath;
 final Color backgroundIcon;
 final int? value;
 final double containerH;
 final double containerW;
 final double imageW;
 final double imageH;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height:containerH ,
      width:containerW,
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(3) ,
        color:backgroundIcon
      ) ,
      child:  Image.asset(imagePath,height:imageH ,width: imageW,fit:BoxFit.fill ,),
    );
  }

  
}