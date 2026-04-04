import 'package:celiac_mobile/core/constants/app_colors.dart';
import 'package:celiac_mobile/core/constants/text_styles.dart';
import 'package:celiac_mobile/core/views/widgets/customContainerDialog.dart';
import 'package:celiac_mobile/core/views/widgets/searchBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninNameWidget extends StatelessWidget {
  const SigninNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      SizedBox(height: 10,),
      SvgPicture.asset("assets/images/Waving Hand Light Skin Tone.svg",width: 100,height: 100,),
        SizedBox(height: 30,),
         const Text('أهلا بك!', style: AppTextStyle.bold25_black),
         SizedBox(height: 20,),
          Text(
          'ما اسمك؟',
          style: AppTextStyle.searchWord
        ),
        SizedBox(height: 5,),
        Box(color: AppColors.semiLightGrey,
        hintText: 'مثال: سارة العبدالله',
        hintStyle: AppTextStyle.bold16_black.copyWith(color: AppColors.darkGreyWithOp4),
        
        ),
        SizedBox(height: 30,),
        GestureDetector(
          onTap:(){},
          child: CustomContainerDialog(
            height: 45,
            width: double.infinity,
            text: 'تحقق',
            color: AppColors.black_container ,
            textStyle: AppTextStyle.searchWord.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
    ],);
  }
}