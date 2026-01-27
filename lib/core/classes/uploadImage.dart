// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';


// class Upload {
//   static imageUploadCamera() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image =
//         await picker.pickImage(source: ImageSource.camera, imageQuality: 90);
//     if (image != null) {
//       return File(image.path);
//     } else {
//       return null;
//     }
//   }

//   static fileUploadGallery([isSvg = false]) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: isSvg
//             ? ["svg", "SVG"]
//             : [
//                 "png",
//                 "PNG",
//                 "jpg",
//                 "JPG",
//               ]);
//     if (result != null) {
//       return File(result.files.single.path!);
//     } else {
//       return null;
//     }
//   }

//   static showButtonSheet(
//       Function() fileUploadGallery, Function() imageUploadCamera) {
//     return Get.bottomSheet(Container(
//       padding: EdgeInsetsDirectional.symmetric(horizontal:10),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//         color: Colors.white,
//       ),
//       height:150,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Select image",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.blue,
//               fontSize:24,
//             ),
//           ),
//           SizedBox(height: 10,),
//           InkWell(
//             onTap: () {
//               fileUploadGallery();
//               Get.back();
//             },
//             child: Row(
//               children: [
//                 const Icon(Icons.image),
//                SizedBox(width: 8,),
//                 Text(
//                   "Image from gallary",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 5,),
//           InkWell(
//             onTap: () {
//               imageUploadCamera();
//               Get.back();
//             },
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.camera,
//                   size: 25,
//                 ),
//                 SizedBox(width: 8,),
//                 Text(
//                   "Image from Camera",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }