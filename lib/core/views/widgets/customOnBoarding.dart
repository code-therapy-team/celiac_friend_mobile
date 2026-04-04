import 'package:flutter/material.dart';

import '../../models/OnBoarding.dart';
import '../screens/signinNameScreen.dart';
import 'circularIndicator.dart';

class CustomOnBoardingWidget extends StatelessWidget {
  const CustomOnBoardingWidget({super.key,required this.pageIndex,required this.onBoardingInfo});
     final int pageIndex;
     final List <OnBordingModel> onBoardingInfo;

  @override

  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
             SizedBox(height:88 ),
              Padding(
                padding: const EdgeInsets.only(right: 43),
                child:onBoardingInfo[pageIndex].title != null?
                 Text(
                    onBoardingInfo[pageIndex].title!,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF634100),
                      fontSize: 30,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                    ),
                  ):SizedBox(height: 60,)
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 47),
                  child: Text(
                      onBoardingInfo[pageIndex].subTitle,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF634100),
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ),
                SizedBox(height: (MediaQuery.of(context).size.height /2.5 ),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 43),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                        Text(
                        'تخطـي',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF634100),
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      
                    CircularIndicator(),
                    
                    
                  ],),
                )
            ]);
  }
}