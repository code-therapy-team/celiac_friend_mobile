import 'package:celus_fe/core/constants/text_styles.dart';
import 'package:flutter/widgets.dart';
import '../../constants/app_colors.dart';

class WidegtError extends StatelessWidget {
  const WidegtError({super.key,  this.widet, required this.text1, required this.text2});
final Widget? widet;
final String text1;
final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width:144 ,
          height: 144,
          child:widet ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(72),
          color: AppColors.semiLightGrey
          ),
        ),
        SizedBox(height:20 ,),
        Text(text1,style:AppTextStyle.bold16_black ,),
         SizedBox(height:10 ,),
        Text(text2,style:AppTextStyle.bold12_mediemGrey ,),
      ],
    );
  }
}