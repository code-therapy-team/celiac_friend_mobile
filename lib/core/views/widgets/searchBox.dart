import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Box extends StatelessWidget {
  const Box({
    super.key,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    required this.color,
    this.onChanged,
    this.controler,
    this.keybordType = TextInputType.text,
    this.textDirection = TextDirection.rtl,
    this.validator,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.inputFormatters,
    this.style,
    this.cursorColor,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Color color;
  final void Function(String)? onChanged;
  final TextEditingController? controler;
  final TextInputType? keybordType;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final Color? cursorColor;
  final EdgeInsetsGeometry contentPadding;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        focusNode: focusNode,
        textAlign: textAlign,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        style: style,
        cursorColor: cursorColor,
        textDirection: textDirection,
        validator: validator,
        controller: controler,

        // onSubmitted:(value) {
        // },
        keyboardType: keybordType,
        onChanged: onChanged,

        decoration: InputDecoration(
          counterText: '',
          contentPadding: contentPadding,
          filled: true,
          fillColor: color,
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: hintStyle,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: color),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: color),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
