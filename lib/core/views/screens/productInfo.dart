
import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:celus_fe/core/constants/app_colors.dart';
import 'package:celus_fe/core/constants/text_styles.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/models/productState.dart';
import 'package:celus_fe/core/services/get_it.dart';
import 'package:celus_fe/core/view_model/productByBarcodeVM.dart';
import 'package:celus_fe/core/views/widgets/bigStack.dart';
import 'package:celus_fe/core/views/widgets/customContainerDialog.dart';
import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  ProductInfo({super.key, required this.product});
  late Product product;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  late Future<dartz.Either<Failure, ProductState>> future;

  @override
  void initState() {
    super.initState();
    future = ProductByBarcodeVM(apiConsumer: getIt<DioConsumer>())
        .get(barcode: widget.product.barcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BigStuck(
        widget: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, top: 25, bottom: 40),
          child: Column(
            children: [
              GestureDetector(
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios,
                        color: AppColors.meduimGrey, size: 20),
                    Text(
                      'رجوع',
                      style: AppTextStyle.bold12_mediemGrey,
                    ),
                  ],
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      widget.product.productName,
                      style: AppTextStyle.bold25_black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 102,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: widget.product.imageURL != null
                            ? Image.network(
                                widget.product.imageURL!,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'assets/images/image 1.png',
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Divider(color: AppColors.lightGrey, thickness: 2),
              SizedBox(height: 39),

              /// -------------------- FutureBuilder -------------------------
              FutureBuilder<dartz.Either<Failure, ProductState>>(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('حدث خطأ في الاتصال');
                  }

                  if (!snapshot.hasData) {
                    return Text('لا توجد بيانات');
                  }

                  // فك الـ Either
                  return snapshot.data!.fold(
                    // في حالة failure
                    (failure) => Text(
                      failure.errorMessage,
                      style: AppTextStyle.bold14_red,
                    ),

                    // في حالة success
                    (productState) {
                      final mapInfo = ProductByBarcodeVM(
                              apiConsumer: getIt<DioConsumer>())
                          .checkState(
                              productSafetyStatus:
                                  productState.productSafetyStatus);

                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: mapInfo['colorContainer'],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                          child: Column(
                            children: [
                              Icon(
                                mapInfo['icon'],
                                color: mapInfo['colorIcon'],
                                size: 28,
                                textDirection: TextDirection.ltr,
                              ),
                              Text(
                                mapInfo['state'],
                                style: mapInfo['textStyle'],
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                ProductByBarcodeVM(
                                        apiConsumer: getIt<DioConsumer>())
                                    .checkType(
                                  type: mapInfo['type'],
                                  positiveVotes:
                                      widget.product.positiveVotes,
                                  negativeVotes:
                                      widget.product.negativeVotes,
                                ),
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bold10_black,
                              ),

                              // زر ابدأ المسح فقط عندما type = 4
                              mapInfo['type'] == 4
                                  ? CustomContainerDialog(
                                      height: 29,
                                      width: 139,
                                      color: AppColors.darkBlue,
                                      text: 'ابدأ المسح',
                                      textStyle: AppTextStyle.bold12_white,
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:celus_fe/core/api/dio_consumer.dart';
// import 'package:celus_fe/core/constants/text_styles.dart';
// import 'package:celus_fe/core/models/product.dart';
// import 'package:celus_fe/core/services/get_it.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../../constants/app_colors.dart';
// import '../../models/productState.dart';
// import '../../view_model/ProductByBarcodeVM.dart';
// import '../widgets/bigStack.dart';
// import '../widgets/customContainerDialog.dart';

// class ProductInfo extends StatefulWidget {
//    ProductInfo({super.key,required this.product});
// late Product product;

//   @override
//   State<ProductInfo> createState() => _ProductInfoState();
// }

// class _ProductInfoState extends State<ProductInfo> {
//    @override
//  var future;
//   void initState() {
//     super.initState();
//     future = ProductByBarcodeVM(apiConsumer: getIt<DioConsumer>()).get(barcode:widget.product.barcode);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BigStuck(widget:Padding(
//         padding:EdgeInsets.only(right:30,left: 30,top:25 ,bottom: 40 ),
//         child: Column(children: [
//           GestureDetector(
//             child: Row(
//               children: [
//                 Icon(Icons.arrow_back_ios,color:AppColors.meduimGrey ,size: 20,),
//                // Text('<  ', style:AppTextStyle.bold12_mediemGrey ,),
//                 Text('رجوع',
//                 style:AppTextStyle.bold12_mediemGrey ,
//                 ),
//               ],
//             ),
//             onTap:(){
//               Navigator.of(context).pop();
//             } ,
//           ),
//           SizedBox(height:10 ,),
//           Container(
//             child:Row(children: [
//               Expanded(
//                 flex: 2,
//                 child:Text(
//                   widget.product.productName,
//                   style:AppTextStyle.bold25_black
//                 ),
//                 ),
//               Expanded(child: Container(
//                height:102,
//               child:ClipRRect(
//                  borderRadius: BorderRadius.circular(16),
//                 child:
//                 widget.product.imageURL!=null? Image.network(widget.product.imageURL!,fit:BoxFit.fill):
//                  Image.asset('assets/images/image 1.png',fit:BoxFit.fill ,),
//               ) ,
//              ),),
//             ],) , 
//           ),
//           SizedBox(height: 35,),
//           Divider(color:AppColors.lightGrey ,thickness:2),
//            SizedBox(height: 39,),
//           FutureBuilder <ProductState?>(
//             future:future ,
//             builder:(con,snapshot) {
//              if(snapshot.hasData)
//              {  Map<String,dynamic> mapInfo= ProductByBarcodeVM(apiConsumer: getIt<DioConsumer>(),).checkState(productSafetyStatus:snapshot.data!.productSafetyStatus,);
//                return Container(
//             width: MediaQuery.of(context).size.width,
//             decoration:BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color:mapInfo['colorContainer']
//             ) ,
//             child:Padding(
//               padding:  EdgeInsets.symmetric(vertical: 14,horizontal:20 ),
//               child: Column(
//                 children: [
//                 Icon(mapInfo['icon'],color:mapInfo['colorIcon'],size:28 ,textDirection:TextDirection.ltr),
//                 Text(mapInfo['state'],
//                style:mapInfo['textStyle'], textAlign:TextAlign.center,),
//              Text(ProductByBarcodeVM(apiConsumer: getIt<DioConsumer>(),).checkType(type:mapInfo['type'], positiveVotes:widget.product.positiveVotes, negativeVotes:widget.product.negativeVotes),
//               textAlign: TextAlign.center,
//               style:AppTextStyle.bold10_black 
//               ),
//                mapInfo['type']==4? CustomContainerDialog(height:29 ,width:139,color:AppColors.darkBlue ,
//                text:'ابدأ المسح' ,textStyle:AppTextStyle.bold12_white ,
//                )
//                :Container()
//               ],),
//             ) ,
//            );
//              }
//         else if(snapshot.hasError){
//           return const Text('error');
//         }
//         else {
//           return const Center(child: CircularProgressIndicator());
//         }
      
//             }
//             )
//         ]),
        
//       ),),
//     );
//   }
// }
// import 'package:celus_fe/core/constants/text_styles.dart';
// import 'package:celus_fe/core/models/product.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../../constants/app_colors.dart';
// import '../../models/productState.dart';
// import '../../view_model/ProductByBarcodeVM.dart';
// import '../widgets/bigStack.dart';
// import '../widgets/customContainerDialog.dart';

// class ProductInfo extends StatefulWidget {
//    ProductInfo({super.key,required this.product});
// late Product product;

//   @override
//   State<ProductInfo> createState() => _ProductInfoState();
// }

// class _ProductInfoState extends State<ProductInfo> {
//    @override
//  var future;
//   void initState() {
//     super.initState();
//     future = ProductByBarcodeVM(Dio()).get(barcode:widget.product.barcode);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BigStuck(widget:Padding(
//         padding:EdgeInsets.only(right:30,left: 30,top:25 ,bottom: 40 ),
//         child: Column(children: [
//           GestureDetector(
//             child: Row(
//               children: [
//                 Icon(Icons.arrow_back_ios,color:AppColors.meduimGrey ,size: 20,),
//                // Text('<  ', style:AppTextStyle.bold12_mediemGrey ,),
//                 Text('رجوع',
//                 style:AppTextStyle.bold12_mediemGrey ,
//                 ),
//               ],
//             ),
//             onTap:(){
//               Navigator.of(context).pop();
//             } ,
//           ),
//           SizedBox(height:10 ,),
//           Container(
//             child:Row(children: [
//               Expanded(
//                 flex: 2,
//                 child:Text(
//                   widget.product.productName,
//                   style:AppTextStyle.bold25_black
//                 ),
//                 ),
//               Expanded(child: Container(
//                height:102,
//               child:ClipRRect(
//                  borderRadius: BorderRadius.circular(16),
//                 child:
//                 widget.product.imageURL!=null? Image.network(widget.product.imageURL!,fit:BoxFit.fill):
//                  Image.asset('assets/images/image 1.png',fit:BoxFit.fill ,),
//               ) ,
//              ),),
//             ],) , 
//           ),
//           SizedBox(height: 35,),
//           Divider(color:AppColors.lightGrey ,thickness:2),
//            SizedBox(height: 39,),
//           FutureBuilder <ProductState?>(
//             future:future ,
//             builder:(con,snapshot) {
//              if(snapshot.hasData)
//              {  Map<String,dynamic> mapInfo= ProductByBarcodeVM(Dio()).checkState(productSafetyStatus:snapshot.data!.productSafetyStatus,);
//                return Container(
//             width: MediaQuery.of(context).size.width,
//             decoration:BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color:mapInfo['colorContainer']
//             ) ,
//             child:Padding(
//               padding:  EdgeInsets.symmetric(vertical: 14,horizontal:20 ),
//               child: Column(
//                 children: [
//                 Icon(mapInfo['icon'],color:mapInfo['colorIcon'],size:28 ,textDirection:TextDirection.ltr),
//                 Text(mapInfo['state'],
//                style:mapInfo['textStyle'], textAlign:TextAlign.center,),
//              Text(ProductByBarcodeVM(Dio()).checkType(type:mapInfo['type'], positiveVotes:widget.product.positiveVotes, negativeVotes:widget.product.negativeVotes),
//               textAlign: TextAlign.center,
//               style:AppTextStyle.bold10_black 
//               ),
//                mapInfo['type']==4? CustomContainerDialog(height:29 ,width:139,color:AppColors.darkBlue ,
//                text:'ابدأ المسح' ,textStyle:AppTextStyle.bold12_white ,
//                )
//                :Container()
//               ],),
//             ) ,
//            );
//              }
//         else if(snapshot.hasError){
//           return const Text('error');
//         }
//         else {
//           return const Center(child: CircularProgressIndicator());
//         }
      
//             }
//             )
//         ]),
        
//       ),),
//     );
//   }
// }