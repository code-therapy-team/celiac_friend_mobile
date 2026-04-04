import 'package:celiac_mobile/core/views/widgets/bigStack.dart';
import 'package:celiac_mobile/core/views/widgets/customOnBoarding.dart';
import 'package:flutter/material.dart';

import '../../models/OnBoarding.dart';
import '../widgets/circularIndicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();

}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;
  int pageIndex=0;
  @override
  void initState() {
   _pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  List <OnBordingModel> listOnBoarding =[
    OnBordingModel(title:'مرحـبــاً' , subTitle:'نحن هنا لمساعدتك في الوصول إلى الأغذية الخالية من الجلوتين' ),
    OnBordingModel(subTitle: 'نساعدك في اختيار الأطعمة المناسبة لك، مع تقييمات من مستخدمين آخرين'),
    OnBordingModel(subTitle: 'انضم إلى مجتمعنا وشارك تجاربك لتساعد الآخرين في اختيار ما يناسبهم.')
    ];
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body:BigStuck(widget: 
     
           
             Expanded(child: 
             PageView.builder(
               itemCount:listOnBoarding.length,
               controller: _pageController,
               onPageChanged:(index){
                setState(() {
                  pageIndex=index;
                });
               } ,
              itemBuilder:(con,index){
                return CustomOnBoardingWidget(pageIndex: index, onBoardingInfo: listOnBoarding);
              }
             
              )
             )
            
      )
      
    );
  }
}

/*BigStuck(widgetColumn: 
      Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 43),
                child: Text(
                    'مرحـبــاً',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF634100),
                      fontSize: 30,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 47),
                  child: Text(
                      'نحن هنا لمساعدتك في الوصول إلى الأغذية الخالية من الجلوتين',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF634100),
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ),
                SizedBox(height: 350,),
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
            ],
          ) ,
      )
      */