import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:celus_fe/core/models/productState.dart';
import 'package:celus_fe/core/services/get_it.dart';
import 'package:celus_fe/helper/error/failures.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';
import '../../view_model/ProductByBarcodeVM.dart';
import '../widgets/bigStack.dart';
import '../widgets/customContainerDialog.dart';

class ScanBarcodeOne extends StatefulWidget {
  const ScanBarcodeOne({super.key});

  @override
  State<ScanBarcodeOne> createState() => _ScanBarcodeOneState();
}

class _ScanBarcodeOneState extends State<ScanBarcodeOne> {
  Future<String?> scanBarcode() async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MobileScannerScreen(
          onDetect: (barcode) {
            Navigator.pop(context, barcode);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BigStuck(
        widget: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('إضافة منتج', style: AppTextStyle.mainWord),
              SizedBox(height: 50),
              Center(
                child: SizedBox(
                  height: 120,
                  width: 80,
                  child: SvgPicture.asset(
                    'assets/images/noun-barcode-scanner-74445.svg',
                    fit: BoxFit.fill,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'الخطوة ١: المسح الضوئي للباركود',
                  style: AppTextStyle.bold14,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'قم بتوجيه الكاميرا نحو الباركود.',
                  style: AppTextStyle.bold12_mediemGrey,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  child: CustomContainerDialog(
                    height: 29,
                    width: 139,
                    text: 'ابدأ المسح',
                    color: AppColors.darkBlue,
                    textStyle: AppTextStyle.bold12_white,
                  ),
                  onTap: () async {
                    final barcode = await scanBarcode();
                    if (barcode == null || barcode.isEmpty) return;
                    if (!mounted) return;

                    final result = await ProductByBarcodeVM(
                      apiConsumer: getIt<DioConsumer>(),
                    ).get(barcode: barcode);

                    //  if (!mounted) return;

                    result.fold(
                      (failure) {
   
                        // Navigator.pop(context);
                      },
                      (productState) {
                        Product product = Product(
                          productName: productState.productName ?? '',
                          barcode: barcode,
                          positiveVotes: 0,
                          negativeVotes: 0,
                          imageURL: productState.imageURL,
                        );
                        if ((product.imageURL ?? '').isNotEmpty ||
                            (product.productName).isNotEmpty) {
                          Navigator.pushNamed(
                            context,
                            '/productInfo',
                            arguments: product,
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            '/addProductScreen',
                            arguments: barcode,
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileScannerScreen extends StatelessWidget {
  final Function(String barcode) onDetect;
  final MobileScannerController controller = MobileScannerController();

  MobileScannerScreen({super.key, required this.onDetect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("مسح الباركود")),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          final barcode = capture.barcodes.first.rawValue;
          if (barcode != null) {
            onDetect(barcode);
          }
        },
      ),
    );
  }
}


// class ScanBarcodeOne extends StatefulWidget {
//   const ScanBarcodeOne({super.key});

//   @override
//   State<ScanBarcodeOne> createState() => _ScanBarcodeOneState();
// }

// class _ScanBarcodeOneState extends State<ScanBarcodeOne> {
//   Future<String?> scanBarcode(BuildContext context) async {
//     String? result;

//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => MobileScannerScreen(
//           onDetect: (barcode) {
//             result = barcode;
//             Navigator.pop(context); // إغلاق الكاميرا بعد قراءة الباركود
//           },
//         ),
//       ),
//     );

//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BigStuck(
//         widget: Padding(
//           padding: EdgeInsets.only(right: 30, left: 30, top: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('إضافة منتج', style: AppTextStyle.mainWord),
//               SizedBox(height: 50),
//               Center(
//                 child: SizedBox(
//                   height: 120,
//                   width: 80,
//                   child: ClipRRect(
//                     child: SvgPicture.asset(
//                       'assets/images/noun-barcode-scanner-74445.svg',
//                       fit: BoxFit.fill,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'الخطوة ١: المسح الضوئي للباركود',
//                   style: AppTextStyle.bold14,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     'قم بالضغط على زر “ابدأ المسح” في الأسفل ثم قم بتوجيه الكاميرا نحو الباركود على غلاف المنتج.',
//                     style: AppTextStyle.bold12_mediemGrey,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24),
//               Center(
//                 child: GestureDetector(
//                   child: CustomContainerDialog(
//                     height: 29,
//                     width: 139,
//                     text: 'ابدأ المسح',
//                     color: AppColors.darkBlue,
//                     textStyle: AppTextStyle.bold12_white,
//                   ),
//                   onTap: () async {
//                     final value = await scanBarcode(context);
                    
//                     /// مهم جدًا لتجنّب الخطأ
//                     if (!mounted) return;
//                     if (value == null || value.isEmpty) return;

//                     print(value);

//                     dartz.Either<Failure, ProductState> resultSearch =
//                         await ProductByBarcodeVM(
//                           apiConsumer: getIt<DioConsumer>(),
//                         ).get(barcode: value);

//                     if (!mounted) return;
//                     resultSearch.fold(
//                       (l) {
//                         Navigator.pushNamed(
//                           context,
//                           '/addProductScreen',
//                           arguments: value,
//                         );
//                       },
//                       (productStateRigth) {
//                         print('found');
//                         Product product = Product(
//                           productName: productStateRigth.productName ?? '',
//                           barcode: value,
//                           positiveVotes: 0,
//                           negativeVotes: 0,
//                           imageURL: productStateRigth.imageURL,
//                         );
//                         Navigator.of(
//                           context,
//                         ).pushNamed('/productInfo', arguments: product);
//                       },
//                     );

//                     // final resultSearch =
//                     //     await ProductByBarcodeVM(apiConsumer: getIt<DioConsumer>(),).get(barcode: value);

//                     // if (resultSearch.productName != null) {
//                     //   print('found');
//                     //   Product product = Product(
//                     //     productName: resultSearch.productName??'',
//                     //     barcode: value,
//                     //     positiveVotes: 0,
//                     //     negativeVotes: 0,
//                     //     imageURL: resultSearch.imageURL,
//                     //   );
//                     //   Navigator.of(context).pushNamed('/productInfo',
//                     //       arguments: product);
//                     // } else {
//                     //   Navigator.pushNamed(context, '/addProductScreen',
//                     //       arguments: value);
//                     // }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MobileScannerScreen extends StatelessWidget {
//   final Function(String barcode) onDetect;
//   final MobileScannerController controller = MobileScannerController();

//   MobileScannerScreen({super.key, required this.onDetect});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("مسح الباركود")),
//       body: MobileScanner(
//         controller: controller,
//         onDetect: (capture) {
//           final barcode = capture.barcodes.first.rawValue;
//           if (barcode != null) {
//             onDetect(barcode);
//           }
//         },
//       ),
//     );
//   }
// }



// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// import '../../constants/app_colors.dart';
// import '../../constants/text_styles.dart';
// import '../../models/product.dart';
// import '../../view_model/ProductByBarcodeVM.dart';
// import '../widgets/bigStack.dart';
// import '../widgets/customContainerDialog.dart';

// class ScanBarcodeOne extends StatelessWidget {
//   const ScanBarcodeOne({super.key});

//   Future<String?> scanBarcode(BuildContext context) async {
//     String? result;

//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => MobileScannerScreen(
//           onDetect: (barcode) {
//             result = barcode;
//             Navigator.pop(context); // إغلاق الكاميرا بعد قراءة الباركود
//           },
//         ),
//       ),
//     );

//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BigStuck(
//         widget: Padding(
//           padding: EdgeInsets.only(right: 30, left: 30, top: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('إضافة منتج', style: AppTextStyle.mainWord),
//               SizedBox(height: 50),
//               Center(
//                 child: SizedBox(
//                   height: 120,
//                   width: 80,
//                   child: ClipRRect(
//                     child: SvgPicture.asset(
//                       'assets/images/noun-barcode-scanner-74445.svg',
//                       fit: BoxFit.fill,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Text('الخطوة ١: المسح الضوئي للباركود',
//                     style: AppTextStyle.bold14),
//               ),
//               SizedBox(height: 10),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     'قم بالضغط على زر “ابدأ المسح” في الأسفل ثم قم بتوجيه الكاميرا نحو الباركود على غلاف المنتج.',
//                     style: AppTextStyle.bold12_mediemGrey,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24),
//               Center(
//                 child: GestureDetector(
//                   child: CustomContainerDialog(
//                     height: 29,
//                     width: 139,
//                     text: 'ابدأ المسح',
//                     color: AppColors.darkBlue,
//                     textStyle: AppTextStyle.bold12_white,
//                   ),
//                   onTap: () async {
//                     final value = await scanBarcode(context);
//                     if (value == null || value.isEmpty) return;

//                     print(value);

//                     final resultSearch =
//                         await ProductByBarcodeVM(Dio()).get(barcode: value);

//                     if (resultSearch.productName != null) {
//                       print('found');
//                       Product product = Product(
//                         productName: resultSearch.productName??'',
//                         barcode: value,
//                         positiveVotes: 0,
//                         negativeVotes: 0,
//                         imageURL: resultSearch.imageURL,
//                       );
//                       Navigator.of(context).pushNamed('/productInfo',
//                           arguments: product);
//                     } else {
//                       Navigator.pushNamed(context, '/addProductScreen',
//                           arguments: value);
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MobileScannerScreen extends StatelessWidget {
//   final Function(String barcode) onDetect;
//   final MobileScannerController controller = MobileScannerController();

//   MobileScannerScreen({super.key, required this.onDetect});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("مسح الباركود")),
//       body: MobileScanner(
//         controller: controller,
//         onDetect: (capture) {
//           final barcode = capture.barcodes.first.rawValue;
//           if (barcode != null) {
//             onDetect(barcode);
//           }
//         },
//       ),
//     );
//   }
// }
