import 'package:celiac_mobile/core/constants/app_colors.dart';
import 'package:celiac_mobile/core/constants/text_styles.dart';
import 'package:celiac_mobile/core/views/widgets/customContainerDialog.dart';
import 'package:celiac_mobile/core/views/widgets/searchBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpWidget extends StatefulWidget {
  final Function(String otp) onVerify;
  final bool hasError;

  const OtpWidget({
    super.key,
    required this.onVerify,
    this.hasError = false,
  });

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  bool _isFilled = false;

  void _onChanged(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
    _checkFilled();
  }

  void _checkFilled() {
    String otp = _controllers.map((e) => e.text).join();
    setState(() {
      _isFilled = otp.length == 4;
    });
  }

  void _submit() {
    if (_isFilled) {
      String otp = _controllers.map((e) => e.text).join();
      widget.onVerify(otp);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text('التحقق', style: AppTextStyle.bold25_black),
        const SizedBox(height: 15),
        Text(
          'أدخل الرمز الذي وصلك\nعلى رقم جوالك',
          textAlign: TextAlign.center,
          style: AppTextStyle.searchWord.copyWith(
            color: AppColors.notFoundGrey,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Box(
                      color: AppColors.semiLightGrey,
                      controler: _controllers[index],
                      focusNode: _focusNodes[index],
                      keybordType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      maxLength: 1,
                      style: AppTextStyle.bold25_black,
                      cursorColor: AppColors.black_container,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) => _onChanged(index, value),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        if (widget.hasError) ...[
          const SizedBox(height: 20),
          Text(
            'الرمز خاطئ! تحقق من الرمز\nالمدخل وحاول مرة أخرى',
            textAlign: TextAlign.center,
            style: AppTextStyle.bold12_mediemGrey.copyWith(
              color: AppColors.darckPinck,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
        ] else ...[
          const SizedBox(height: 60), // space mapping to error height to avoid layout shift
        ],
        GestureDetector(
          onTap: _isFilled ? _submit : null,
          child: CustomContainerDialog(
            height: 45,
            width: double.infinity,
            text: 'تحقق',
            color: _isFilled && !widget.hasError 
                ? AppColors.black_container 
                : AppColors.meduimGrey,
            textStyle: AppTextStyle.searchWord.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
