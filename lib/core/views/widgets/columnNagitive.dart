import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:celus_fe/core/models/choise.dart';
import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/services/get_it.dart';
import 'package:celus_fe/core/view_model/reasonsVM.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../classes/voteData.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../view_model/votingVM.dart';
import 'cotainerIcon.dart';
import 'customContainerDialog.dart';

class ColumnNagitive extends StatefulWidget {
  const ColumnNagitive({super.key,required this.product});
final Product product;

  @override
  State<ColumnNagitive> createState() => _ColumnNagitiveState();
}

class _ColumnNagitiveState extends State<ColumnNagitive> {
   @override
   bool isLoading =false;
    VoteData voteData=VoteData();
  var future;
  void initState() {
    super.initState();
    future = ReasonsVM(apiConsumer: getIt<DioConsumer>(),).get();
    // future = ReasonsVM(Dio()).get();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ChoiseModel>?>(
      future:future ,
      builder:(con,snapshot){
        if (snapshot.hasData){
          return ModalProgressHUD(
            inAsyncCall:isLoading ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ContainerIcon(imagePath:'assets/images/ok.png', backgroundIcon:AppColors.pinck, containerH:45, containerW:45,
              imageH:16 ,
              imageW:16 ,
              ),
              Text('السبب :',style:AppTextStyle.bold18_black ,),
              GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:snapshot.data![0].text, height: 49, width:228,textStyle:AppTextStyle.bold14_white),
              onTap: ()async{
                isLoading= true;
                setState(() {
                  
                });
                  if (widget.product.voteStatus==null || widget.product.voteStatus=="SAFE") {
                 await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode:int.parse(widget.product.barcode), voteData:voteData.negativeVote);
                }else if(widget.product.voteStatus=="UNSAFE"){
                 await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode:int.parse(widget.product.barcode), voteData:voteData.deleteVote);
                }
                isLoading =false;
                setState(() {
                  
                });
              Navigator.pushNamed(context, "/allProductionScreen" );
              },
              ),
              
               GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text: snapshot.data![1].text ,height: 49, width:228,textStyle:AppTextStyle.bold14_white),
             onTap: ()async{
              isLoading =true;
              setState(() {});
                  if (widget.product.voteStatus==null|| widget.product.voteStatus=="SAFE") {
                    print(widget.product.voteStatus);
                 await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode:int.parse(widget.product.barcode), voteData:voteData.negativeVote);
                }else if(widget.product.voteStatus=="UNSAFE"){
                   print(widget.product.voteStatus);
                 await VotingVM(apiConsumer: getIt<DioConsumer>(),).postVote(productBarcode:int.parse(widget.product.barcode), voteData:voteData.deleteVote);

                }
                isLoading =false;
              setState(() {});
              Navigator.pushNamed(context, "/allProductionScreen" );
              },
               ),
              CustomContainerDialog(color: AppColors.red, text:'إلغاء',height: 49, width:228,textStyle:AppTextStyle.bold14_white)
            ],),
          );
          
        }
         else if(snapshot.hasError)
             return Text('error');
            else 
             return Center(child: CircularProgressIndicator());
      })
   ;
  }
}
 
// import 'package:celus_fe/core/api/dio_consumer.dart';
// import 'package:celus_fe/core/models/choise.dart';
// import 'package:celus_fe/core/models/product.dart';
// import 'package:celus_fe/core/services/get_it.dart';
// import 'package:celus_fe/core/view_model/reasonsVM.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import '../../classes/voteData.dart';
// import '../../constants/app_colors.dart';
// import '../../constants/text_styles.dart';
// import '../../view_model/votingVM.dart';
// import 'cotainerIcon.dart';
// import 'customContainerDialog.dart';

// class ColumnNagitive extends StatefulWidget {
//   const ColumnNagitive({super.key,required this.product});
// final Product product;

//   @override
//   State<ColumnNagitive> createState() => _ColumnNagitiveState();
// }

// class _ColumnNagitiveState extends State<ColumnNagitive> {
//    @override
//    bool isLoading =false;
//     VoteData voteData=VoteData();
//   var future;
//   void initState() {
//     super.initState();
//     future = ReasonsVM(apiConsumer: getIt<DioConsumer>(),).get();
//     // future = ReasonsVM(Dio()).get();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder <List<ChoiseModel>?>(
//       future:future ,
//       builder:(con,snapshot){
//         if (snapshot.hasData){
//           return ModalProgressHUD(
//             inAsyncCall:isLoading ,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//               ContainerIcon(imagePath:'assets/images/ok.png', backgroundIcon:AppColors.pinck, containerH:45, containerW:45,
//               imageH:16 ,
//               imageW:16 ,
//               ),
//               Text('السبب :',style:AppTextStyle.bold18_black ,),
//               GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text:snapshot.data![0].text, height: 49, width:228,textStyle:AppTextStyle.bold14_white),
//               onTap: ()async{
//                 isLoading= true;
//                 setState(() {
                  
//                 });
//                   if (widget.product.voteStatus==null || widget.product.voteStatus=="SAFE") {
//                  await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode), voteData:voteData.negativeVote);
//                 }else if(widget.product.voteStatus=="UNSAFE"){
//                  await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode), voteData:voteData.deleteVote);
//                 }
//                 isLoading =false;
//                 setState(() {
                  
//                 });
//               Navigator.pushNamed(context, "/allProductionScreen" );
//               },
//               ),
              
//                GestureDetector(child: CustomContainerDialog(color:AppColors.darkBlue,text: snapshot.data![1].text ,height: 49, width:228,textStyle:AppTextStyle.bold14_white),
//              onTap: ()async{
//               isLoading =true;
//               setState(() {});
//                   if (widget.product.voteStatus==null|| widget.product.voteStatus=="SAFE") {
//                     print(widget.product.voteStatus);
//                  await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode), voteData:voteData.negativeVote);
//                 }else if(widget.product.voteStatus=="UNSAFE"){
//                    print(widget.product.voteStatus);
//                  await VotingVM(Dio()).postVote(productBarcode:int.parse(widget.product.barcode), voteData:voteData.deleteVote);

//                 }
//                 isLoading =false;
//               setState(() {});
//               Navigator.pushNamed(context, "/allProductionScreen" );
//               },
//                ),
//               CustomContainerDialog(color: AppColors.red, text:'إلغاء',height: 49, width:228,textStyle:AppTextStyle.bold14_white)
//             ],),
//           );
          
//         }
//          else if(snapshot.hasError)
//              return Text('error');
//             else 
//              return Center(child: CircularProgressIndicator());
//       })
//    ;
//   }
// }
 