import 'package:celiac_mobile/core/constants/text_styles.dart';
import 'package:celiac_mobile/helper/utils/svgLoadingSpinner.dart';
import 'package:flutter/material.dart';

class LoadingSigninWidget extends StatelessWidget {
  const LoadingSigninWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 5,),
      Text('دخول', style: AppTextStyle.bold25_black),
      AspectRatio(
        aspectRatio: 2/1,
        child: SizedBox(height: 30,)),
        Center(child: SvgLoadingSpinner(size:100 ,)),
          AspectRatio(
        aspectRatio: 2/1,
        child: SizedBox(height: 30,)),
    ],);
  }
}