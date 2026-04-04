
import 'package:celiac_mobile/core/constants/app_colors.dart';
import 'package:celiac_mobile/core/constants/text_styles.dart';
import 'package:celiac_mobile/core/views/widgets/country_code.dart';
import 'package:celiac_mobile/core/views/widgets/customContainerDialog.dart';
import 'package:celiac_mobile/core/views/widgets/customContainrtWithWidget.dart';
import 'package:celiac_mobile/core/views/widgets/searchBox.dart';
import 'package:celiac_mobile/helper/cubits/otp_cubit/otp_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SigninWidget extends StatelessWidget {
  const SigninWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10), // Spacing from top
        CustomContainer(
          colorContainer: AppColors.pinck,
          colorBorder: AppColors.pinck,
          radius: 20,
          widget: Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 28),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.error,
                    color: AppColors.darckPinck,
                    size: 28,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'هذه الخاصية تتطلب تسجيل الدخول',
                    style: AppTextStyle.bold12_mediemGrey.copyWith(
                      color: AppColors.darckPinck,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text('دخول', style: AppTextStyle.bold25_black),
        SizedBox(height: 15),
       
    
        Text('رقم الجوال', style: AppTextStyle.searchWord),
        SizedBox(height: 5), 
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Box(
            controler: phoneController,
            validator: (value){
              if(value!.isEmpty){
                return 'يرجى ادخال رقم الجوال';
              }
              if(value.length<6){
               return 'رقم الجوال يجب أن لا يقل عن 6 أرقام ';
              }
              return null;
          
            },
            color: AppColors.semiLightGrey,
            suffixIcon: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize
                    .min, // Crucial: prevents the Row from taking infinite width
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    color: AppColors.verticalDividerColor,
                    width: 3,
                    height: double
                        .infinity, // Now safely takes up the full height
                  ),
                 CustomCountryCodePicker(
                    onChanged: (code) {
                      print("$code     nooooor");
                      
                    },
                  ),
                ],
              ),
            ),
            keybordType: TextInputType.phone,
            textDirection: TextDirection.ltr,
          ),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () async{
            if(formKey.currentState!.validate()){
              print('correct');
              // context.read<OtpCubitCubit>().sendOtp(
              BlocProvider.of<OtpCubitCubit>(context).sendOtp(
                phoneNumber: phoneController.text,
              );
              
            }
          },
          child: CustomContainerDialog(
            height: 32,
            width: double.infinity,
            text: 'دخول',
            color: AppColors.black_container,
            textStyle: AppTextStyle.searchWord.copyWith(
              color: Colors.white,
            ),
            
          ),
        ),
      ],
    );
  }
}
