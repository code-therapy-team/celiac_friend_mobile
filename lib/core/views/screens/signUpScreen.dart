import 'package:celus_fe/core/views/widgets/containerSignIn.dart';
import 'package:celus_fe/core/views/widgets/password_section.dart';
import 'package:celus_fe/core/views/widgets/user_section.dart';
import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea prevents content from going under the notch or status bar
      body: SafeArea(
        child: ContainerSignIn(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10), // Spacing from top
              Text(
                'حساب جديد',
                style: AppTextStyle.CairoRegular24,
              ),
              const SizedBox(height: 15),
              User_section(),
              const SizedBox(height: 15),     
              Password_section ()       
            ],
          ),
        ),
      ),
    );
  }
}





class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = "";
  String password = "";

  bool get onlyEnglishLetters =>
      RegExp(r'^[a-zA-Z]+$').hasMatch(username) && username.isNotEmpty;

  bool get max12Chars => username.length <= 12 && username.isNotEmpty;

  bool get uniqueName => username.isNotEmpty; // placeholder

  bool get min8Chars => password.length >= 8;

  bool get hasUppercase => password.contains(RegExp(r'[A-Z]'));

  bool get hasLowercase => password.contains(RegExp(r'[a-z]'));

  bool get hasSpecialChar =>
      password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

  Widget validationChip(String text, bool valid) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(right: 8, top: 8),
      decoration: BoxDecoration(
        color: valid ? Colors.green.shade50 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: valid ? Colors.green : Colors.grey),
      ),
      child: Row(
        children: [
          Icon(valid ? Icons.check_circle : Icons.circle_outlined,
              color: valid ? Colors.green : Colors.grey, size: 18),
          const SizedBox(width: 6),
          FittedBox(fit: BoxFit.scaleDown,child: Text(text, style: TextStyle(color: valid ? Colors.green : Colors.black))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text("حساب جديد",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
    
              // USERNAME SECTION
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text("اسم المستخدم",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
              const SizedBox(height: 12),
              TextField(
                onChanged: (v) => setState(() => username = v),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  validationChip("احرف انجليزيه فقط", onlyEnglishLetters),
                  validationChip("لاينبغي أن يتجاوز 12 حرفاً", max12Chars),
                ],
              ),
              validationChip("اسم مستخدم فريد", uniqueName),
    
              const SizedBox(height: 35),
    
              // PASSWORD SECTION
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text("كلمة المرور",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
              const SizedBox(height: 12),
              TextField(
                obscureText: true,
                onChanged: (v) => setState(() => password = v),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                ),
              ),
              Row(
                children: [
                  validationChip("8 أحرف على الأقل", min8Chars),
                  validationChip("حرف كبير واحد", hasUppercase),
                ],
              ),
              Row(
                children: [
                  validationChip("حرف صغير واحد", hasLowercase),
                  validationChip("حرف خاص واحد", hasSpecialChar),
                ],
              ),
    
              const SizedBox(height: 35),
    
              // BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Text("تسجيل",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
    
              const SizedBox(height: 20),
              const Text("أو", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text("تسجيل الدخول",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              )
            ],
          );
  }
}
