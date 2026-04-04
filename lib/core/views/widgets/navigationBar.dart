import 'package:celiac_mobile/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 298,
      height: 61,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(30.50),
        color: AppColors.lightBlak
      ) ,
      child: Row(mainAxisAlignment:MainAxisAlignment.spaceAround ,
        children: [
         SizedBox(
               height:32,
               width:32 ,
               child:ClipRRect(
                child:Image.asset('assets/images/Female Profile.png',fit:BoxFit.fill ,),  
              ) ,
             ),
              SizedBox(
               height:32,
               width:32 ,
               child:ClipRRect(
                child:Image.asset('assets/images/CookingBook.png',fit:BoxFit.fill ,),  
              ) ,
             ),
        SizedBox(
               height:32,
               width:32 ,
               child:ClipRRect(
                child:Image.asset('assets/images/Barcode.png',fit:BoxFit.fill ,),  
              ) ,
             ),
              SizedBox(
               height:32,
               width:32 ,
               child:ClipRRect(
                child:Image.asset('assets/images/Restaurant.png',fit:BoxFit.fill ,),  
              ) ,
             ),
               SizedBox(
               height:32,
               width:32 ,
               child:ClipRRect(
                child:Image.asset('assets/images/AskQuestion.png',fit:BoxFit.fill ,),  
              ) ,
             ),
     
     
      ],),
    );
  }
}