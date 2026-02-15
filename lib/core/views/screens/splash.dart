import 'package:celiac_mobile/core/views/screens/onBoardingScreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(builder:(con){
        return OnBoarding();
      }));
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width:MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height,
        color:Color(0xFFB08A40),
        child:Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height-13 ,
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(
                  height:116 ,
                  width:116 ,
                  child: Image.asset('assets/images/Logo.png'),
                  ),
                SizedBox(height:20 ,),
                Text('Celiac Friend',style: TextStyle(
                  color: Color(0xFF634100),
                  fontSize: 26,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height:10 ,),
                  Text(
                      'جار التحميل ...',
                      //textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF634100),
                        fontSize: 18,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
               
                
              ],),
            ),
            Container(height:3 ,
           width: 240 ,
           color: Colors.black,
           )
          ],
        ) ,
      ) ,
    );
  }
}