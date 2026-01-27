import 'package:celus_fe/core/views/screens/signUpScreen.dart';
import 'package:celus_fe/core/views/widgets/customContainrtWithWidget.dart';
import 'package:flutter/material.dart';

// class ContainerSignIn extends StatelessWidget {
//   const ContainerSignIn({super.key,required this.widget});
// final Widget widget;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        width: MediaQuery.of(context).size.width ,
//           // height: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(
//         image: DecorationImage(image:AssetImage('assets/images/Home Page.png',), fit: BoxFit.cover, )
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 24,
//           //vertical:(MediaQuery.of(context).size.height /3)
//           ),
//         child: CustomContainer(
//                 colorContainer:Colors.white, 
//                 colorBorder: Colors.white, 
//                 radius: 16, 
//                 paddinHorizental:8, 
//                 paddingVertical: 16,
//                 widget: RegisterPage(),
//                 ),
//       ),
//     );
//   }
// }

class ContainerSignIn extends StatelessWidget {
  const ContainerSignIn({super.key,required this.widget});
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width ,
       height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/images/Home Page.png',), fit: BoxFit.cover, )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:16,
          //vertical:(MediaQuery.of(context).size.height /3)
          ),
        child: Column(
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: CustomContainer(
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
            ),
              Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}