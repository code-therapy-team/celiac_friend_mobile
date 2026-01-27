import 'package:celus_fe/core/views/widgets/verticalLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class SuffixInSearchBox extends StatelessWidget {
  const SuffixInSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 60,
           child: Row(children: [
            Icon(Icons.search,color:AppColors.meduimGrey),
             VerticalLine(height: 16,),
               SizedBox(width: 3,),
             Padding(
              padding:EdgeInsets.only(top:5 ) ,
            child:GestureDetector(
              child: SvgPicture.asset('assets/images/noun-barcode-scanner-74445.svg' ,height: 30,width: 25,
              color:AppColors.meduimGrey ,),
              onTap:(){
                Navigator.pushNamed(context, '/scanBarcodeOne');
              } ,
            )
            ),
           ],),
         );
  }
}