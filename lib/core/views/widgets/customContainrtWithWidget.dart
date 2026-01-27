import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.colorContainer,required this.colorBorder,required this.widget
,required this.radius,required this.paddinHorizental,required this.paddingVertical
  });
final Color colorContainer ;
final Color colorBorder;
final Widget widget;
final double radius;
final double paddingVertical;
final double paddinHorizental;

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration:BoxDecoration(
                  color:colorContainer,
                  borderRadius:BorderRadius.circular(radius) ,
                  border:Border.all(color:colorBorder)
                ) ,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:paddinHorizental,vertical:paddingVertical ),
                  child: widget,
                ),
              );
  }
}