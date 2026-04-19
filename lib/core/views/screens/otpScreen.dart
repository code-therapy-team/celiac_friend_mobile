import 'package:celus_fe/core/views/widgets/containerSignIn.dart';
import 'package:celus_fe/core/views/widgets/otpWidget.dart';
import 'package:celus_fe/helper/cubits/otp_cubit/otp_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _hasError = false;

  void _verifyOtp(String otp) {
    // Pro Mock Logic: let's test that 1234 is correct for demo
    if (otp == "1234") {
      setState(() {
        _hasError = false;
      });
      // Optionally navigate to next screen or show success
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تم التحقق بنجاح')));

      BlocProvider.of<OtpCubitCubit>(context).verifyOtp(otp: otp);
    } else {
      // Show Error state
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OtpWidget(onVerify: _verifyOtp, hasError: _hasError);
  }
}
