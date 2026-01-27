import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:celus_fe/core/constants/text_styles.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/services/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../classes/voteData.dart';
import '../../constants/app_colors.dart';
import '../../models/choise.dart';
import '../../view_model/sourcesVM.dart';
import '../../view_model/votingVM.dart';
import 'cotainerIcon.dart';
import 'customContainerDialog.dart';

class ColumnPosative extends StatefulWidget {
  const ColumnPosative({super.key,required this.product});
final Product product;

  @override
  State<ColumnPosative> createState() => _ColumnPosativeState();
}

class _ColumnPosativeState extends State<ColumnPosative> {
   @override
   bool isLoading=false;
   VoteData voteData=VoteData();
  late Future<List<ChoiseModel>> future;
  @override
  void initState() {
    super.initState();
    future = SourceVM(apiConsumer: getIt<DioConsumer>(),).get();
  }
  @override
  
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChoiseModel>?>(
      future: future,
      builder:(con,snapshot){
        if(snapshot.hasData)
        {
          return ModalProgressHUD(
            inAsyncCall:isLoading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ContainerIcon(imagePath:'assets/images/ok.png', backgroundIcon:AppColors.lightGreen, containerH:45, containerW:45,
              imageH:32.73 ,
              imageW:32.73 ,
              ),
              const Text('مصدر المعلومات:',style:AppTextStyle.bold18_black ,),
               GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:snapshot.data![0].text ,height: 49, width:228, textStyle:AppTextStyle.bold14_white ,),
              onTap: ()async{ 
                isLoading =true;
                setState(() {
                  
                });
                 if (widget.product.voteStatus==null || widget.product.voteStatus=="UNSAFE") {
                 await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode:int.parse(widget.product.barcode!) , voteData:voteData.positiveVote);
                }else if(widget.product.voteStatus=="SAFE"){
                 await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode:int.parse(widget.product.barcode!) , voteData:voteData.deleteVote);
                }
                isLoading=false;
                setState(() {
                  
                });
              Navigator.pushNamed(context, "/allProductionScreen" );
              },
              ),
              GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text: snapshot.data![1].text,height: 49, width:228,textStyle:AppTextStyle.bold14_white),
              onTap: ()async{  
                isLoading =true;
                setState(() {
                  
                });
                 if (widget.product.voteStatus==null || widget.product.voteStatus=="UNSAFE") {
                 await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode:int.parse(widget.product.barcode!) , voteData:voteData.positiveVote);
                }else if(widget.product.voteStatus=="SAFE"){
                 await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode:int.parse(widget.product.barcode!) , voteData:voteData.deleteVote);
                }
                isLoading =false;
                setState(() {
                  
                });
              Navigator.pushNamed(context, "/allProductionScreen" );
              },
              ),
              const CustomContainerDialog(color: AppColors.red, text:'إلغاء',height: 49, width:228,textStyle:AppTextStyle.bold14_white)
            ],),
          );
        }
        else if(snapshot.hasError){
          return const Text('error');
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      
        
      }, );
  }
}
// import 'package:celus_fe/core/api/dio_consumer.dart';
// import 'package:celus_fe/core/constants/text_styles.dart';
// import 'package:celus_fe/core/models/product.dart';
// import 'package:celus_fe/core/services/get_it.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import '../../classes/voteData.dart';
// import '../../constants/app_colors.dart';
// import '../../models/choise.dart';
// import '../../view_model/sourcesVM.dart';
// import '../../view_model/votingVM.dart';
// import 'cotainerIcon.dart';
// import 'customContainerDialog.dart';

// class ColumnPosative extends StatefulWidget {
//   const ColumnPosative({super.key,required this.product});
// final Product product;

//   @override
//   State<ColumnPosative> createState() => _ColumnPosativeState();
// }

// class _ColumnPosativeState extends State<ColumnPosative> {
//    @override
//    bool isLoading=false;
//    VoteData voteData=VoteData();
//   late Future<List<ChoiseModel>> future;
//   @override
//   void initState() {
//     super.initState();
//     future = SourceVM(apiConsumer: getIt<DioConsumer>(),).get();
//   }
//   @override
  
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ChoiseModel>?>(
//       future: future,
//       builder:(con,snapshot){
//         if(snapshot.hasData)
//         {
//           return ModalProgressHUD(
//             inAsyncCall:isLoading,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//               ContainerIcon(imagePath:'assets/images/ok.png', backgroundIcon:AppColors.lightGreen, containerH:45, containerW:45,
//               imageH:32.73 ,
//               imageW:32.73 ,
//               ),
//               const Text('مصدر المعلومات:',style:AppTextStyle.bold18_black ,),
//                GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:snapshot.data![0].text ,height: 49, width:228, textStyle:AppTextStyle.bold14_white ,),
//               onTap: ()async{ 
//                 isLoading =true;
//                 setState(() {
                  
//                 });
//                  if (widget.product.voteStatus==null || widget.product.voteStatus=="UNSAFE") {
//                  await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode!) , voteData:voteData.positiveVote);
//                 }else if(widget.product.voteStatus=="SAFE"){
//                  await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode!) , voteData:voteData.deleteVote);
//                 }
//                 isLoading=false;
//                 setState(() {
                  
//                 });
//               Navigator.pushNamed(context, "/allProductionScreen" );
//               },
//               ),
//               GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text: snapshot.data![1].text,height: 49, width:228,textStyle:AppTextStyle.bold14_white),
//               onTap: ()async{  
//                 isLoading =true;
//                 setState(() {
                  
//                 });
//                  if (widget.product.voteStatus==null || widget.product.voteStatus=="UNSAFE") {
//                  await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode!) , voteData:voteData.positiveVote);
//                 }else if(widget.product.voteStatus=="SAFE"){
//                  await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode!) , voteData:voteData.deleteVote);
//                 }
//                 isLoading =false;
//                 setState(() {
                  
//                 });
//               Navigator.pushNamed(context, "/allProductionScreen" );
//               },
//               ),
//               const CustomContainerDialog(color: AppColors.red, text:'إلغاء',height: 49, width:228,textStyle:AppTextStyle.bold14_white)
//             ],),
//           );
//         }
//         else if(snapshot.hasError){
//           return const Text('error');
//         }
//         else {
//           return const Center(child: CircularProgressIndicator());
//         }
      
        
//       }, );
//   }
// }