import 'package:celus_fe/core/views/screens/otpScreen.dart';
import 'package:celus_fe/core/views/widgets/containerSignIn.dart';
import 'package:celus_fe/core/views/widgets/loadingSingin.dart';
import 'package:celus_fe/core/views/widgets/signinNameWidget.dart';
import 'package:celus_fe/core/views/widgets/signin_widget.dart';
import 'package:celus_fe/helper/cubits/otp_cubit/otp_cubit_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea prevents content from going under the notch or status bar
      body: BlocProvider(
        create: (context) => OtpCubitCubit(),
        child: SafeArea(
          child: ContainerSignIn(
            widget: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.07,
              ),
              child: BlocConsumer<OtpCubitCubit, OtpState>(
                listener: (context, state) {
                  // go to home screen after enter your name or after verify otp
                },
                builder: (context, state) {
                  if(state is OtpVerifyNumber){
                    return OtpScreen();
                  }else if (state is OtpErrorState) {
                    return Center( 
                      child: Text(state.errorMessage));
                  }else if (state is OtpLoading) {
                    return LoadingSigninWidget();
                  }else if( state is OtpVerifyOTP){
                    return SigninNameWidget();
                  }
                  return SigninWidget(formKey: formKey);
                },
              ),
              //child: LoadingSigninWidget(),
              // child: SigninNameWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
