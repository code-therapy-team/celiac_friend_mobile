import 'package:celus_fe/core/constants/text_styles.dart';
import 'package:celus_fe/core/views/widgets/searchBox.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'customContainrtWithWidget.dart';

class User_section extends StatelessWidget {
  const User_section({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
                'اسم المستخدم',
                style: AppTextStyle.CairoSemiBold18,
              ),
               const SizedBox(height: 12),
              Box(color: AppColors.semiLightGrey), 
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomContainer(
                      colorContainer: AppColors.semiDarkGrey,
                      colorBorder: AppColors.semiDarkGrey,
                      radius: 16,
                      paddinHorizental: 8,
                      paddingVertical: 6,
                      widget: FittedBox(
                        fit: BoxFit.scaleDown, // scaleDown is often safer than fill
                        child: Row(
                          children: [
                            Icon(Icons.check,
                                color: AppColors.darkGreyWithOp8, size: 18),
                            const SizedBox(width: 4),
                            const Text('احرف انجليزيه فقط')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: CustomContainer(
                      colorContainer: AppColors.semiDarkGrey,
                      colorBorder: AppColors.semiDarkGrey,
                      radius: 16,
                      paddinHorizental: 8,
                      paddingVertical: 6,
                      widget: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            Icon(Icons.check,
                                color: AppColors.darkGreyWithOp8, size: 18),
                            const SizedBox(width: 4),
                            const Text('لا ينبغي أن يتجاوز 12 حرفاً')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              CustomContainer(
                      colorContainer: AppColors.semiDarkGrey,
                      colorBorder: AppColors.semiDarkGrey,
                      radius: 16,
                      paddinHorizental: 8,
                      paddingVertical: 6,
                      widget: FittedBox(
                        fit: BoxFit.scaleDown, // scaleDown is often safer than fill
                        child: Row(
                          children: [
                            Icon(Icons.check,
                                color: AppColors.darkGreyWithOp8, size: 18),
                            const SizedBox(width: 4),
                            const Text('اسم مستخدم فريد')
                          ],
                        ),
                      ),
                    ),

    ],);
  }
}