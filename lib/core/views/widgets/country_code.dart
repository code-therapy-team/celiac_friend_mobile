import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

// تم تغيير اسم الكلاس لتجنب التضارب مع كلاس CountryCode الخاص بالمكتبة
class CustomCountryCodePicker extends StatelessWidget {
  const CustomCountryCodePicker({super.key, this.onChanged, this.onInit});

  // 1. استخدام ValueChanged كما تطلب المكتبة تماماً
  final ValueChanged<CountryCode>? onChanged;
  final ValueChanged<CountryCode?>? onInit;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CountryCodePicker(
        // 2. تمرير الدوال مباشرة
        onInit: onInit,
        onChanged:onChanged,
        initialSelection: 'SA',

        // 4. Puts Saudi Arabia at the top of the selection list
        favorite: const ['+966', 'SA'],

        // Add this property right here to make the flag circular!
        flagDecoration: const BoxDecoration(shape: BoxShape.circle),
        margin: const EdgeInsets.only(right: 0),
        // You can also adjust the size of the circle by changing the flagWidth
        flagWidth: 40.0,
      ),
    );
  }
}
// void _calculateDigits( String selectedCountryCode , String phoneNumber) {
 
 
//   int totalDigits = 0;
//     // دمج المفتاح مع الرقم
//     String fullNumber = selectedCountryCode + phoneNumber;
//     // تنظيف النص من أي رموز (مثل +) وترك الأرقام فقط
//     String digitsOnly = fullNumber.replaceAll(RegExp(r'\D'), '');
    
   
//       totalDigits = digitsOnly.length;
   
//   }