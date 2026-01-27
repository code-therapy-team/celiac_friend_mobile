import 'package:celus_fe/core/services/init_services.dart';
import 'package:celus_fe/core/views/screens/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'helper/appRoute.dart';

void main() async{
 await InitServices.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         locale: const Locale('ar'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        debugShowCheckedModeBanner: false,
    //home:SignUpScreen(),
      initialRoute: '/allProductionScreen',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}