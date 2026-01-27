
import 'package:flutter/material.dart';
import 'app_colors.dart';
abstract class AppTextStyle {
  static const TextStyle mainWord = TextStyle(
   
    fontWeight: FontWeight.w700,
    fontSize: 30,
    fontFamily:'Samim',
    color:AppColors.black,
  );

  static TextStyle searchWord = TextStyle(
    fontSize: 18,
    fontFamily: 'Samim',
    fontWeight: FontWeight.w700,
    color:AppColors.darkGrey,
  );

  static const TextStyle bold8 = TextStyle(
   color: AppColors.black,
       fontSize: 8,
       fontFamily: 'Samim',
       fontWeight: FontWeight.w700,
  );
   static const TextStyle greyBold8 = TextStyle(
   color: AppColors.meduimGrey,
       fontSize: 8,
       fontFamily: 'Samim',
       fontWeight: FontWeight.w700,
  );
  static const TextStyle bold14 = TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle bold25_black = TextStyle(
              color: AppColors.black,
              fontSize: 25,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle bold14_white = TextStyle(
              color:Colors.white,
              fontSize: 14,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
   static const TextStyle bold12_white = TextStyle(
              color:Colors.white,
              fontSize: 12,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle bold14_red = TextStyle(
              color:AppColors.red,
              fontSize: 14,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle bold14_darkGreen = TextStyle(
              color:AppColors.darkGreen,
              fontSize: 14,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle bold14_darkBlue = TextStyle(
              color:AppColors.darkBlue,
              fontSize: 14,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle bold18_black = TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
   static const TextStyle bold10_black = TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              height: 2,
              );
   static const TextStyle bold16_black = TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              height: 2,
              );
  static const TextStyle bold10_grey = TextStyle(
              color: AppColors.meduimGrey,
              fontSize: 10,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              height: 2,
              );
 static const TextStyle bold12_mediemGrey = TextStyle(
              color: AppColors.meduimGrey,
              fontSize: 12,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
 static const TextStyle notFoundGrey= TextStyle(
              color: AppColors.notFoundGrey,
              fontSize: 14,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
 static const TextStyle darkGreen10 =TextStyle(
              color: AppColors.darkGreen,
              fontSize: 10,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
 static const TextStyle darkPinck10 =TextStyle(
              color: AppColors.darckPinck,
              fontSize: 10,
              fontFamily: 'Samim',
              fontWeight: FontWeight.w700,
              );
  static const TextStyle CairoRegular24 =TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              );
  static  TextStyle CairoSemiBold18 =TextStyle(
              color: AppColors.darkGrey,
              fontSize: 18,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              );
  static  TextStyle CairoSemiBold12 =TextStyle(
              color: AppColors.darkGreyWithOp8,
              fontSize: 12,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              );



}