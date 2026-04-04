import 'package:celiac_mobile/core/views/widgets/customContainrtWithWidget.dart';
import 'package:flutter/material.dart';


class ContainerSignIn extends StatelessWidget {
  const ContainerSignIn({super.key,required this.widget});
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
       width: MediaQuery.of(context).size.width ,
       height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/images/Home Page.png',), fit: BoxFit.cover, )
      ),
      child: Column(
        children: [
          SizedBox(height: 100,),
          // Expanded(flex: 1, child: SizedBox()),
          // Expanded(
          //   flex: 3,
          //   child: CustomContainer(
          //     colorContainer:Colors.white, 
          //     colorBorder: Colors.white, 
          //     radius: 16, 
          //     paddinHorizental:8, 
          //     paddingVertical: 16,
          //     widget: Container(
          //       alignment: Alignment.centerRight,
          //       child: widget,
          //       ),
          //     ),
          // ),
          //   Expanded(flex: 1, child: SizedBox()),
           CustomContainer(
              colorContainer:Colors.white, 
              colorBorder: Colors.white, 
              radius: 16, 
              paddinHorizental:8, 
              paddingVertical: 16,
              widget: Container(
                alignment: Alignment.centerRight,
                child: widget,
                ),
              ),
      
        ],
      ),
    );
  }
}