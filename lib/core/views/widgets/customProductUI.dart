import 'package:celus_fe/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';
import 'columnNagitive.dart';
import 'columnPosative.dart';
import 'iconWithValue.dart';
import 'showDialog.dart';

class CustomProductUI extends StatefulWidget {
  const CustomProductUI({super.key,required this.product});
final Product product;

  @override
  State<CustomProductUI> createState() => _CustomProductUIState();
}

class _CustomProductUIState extends State<CustomProductUI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(children: [
           Expanded(
             child: Container(
               height:104,
              child:GestureDetector(
                child: ClipRRect(
                   borderRadius: BorderRadius.circular(16),
                  child: widget.product.imageURL!=null? Image.network(widget.product.imageURL!,fit:BoxFit.fill):
                   Image.asset('assets/images/image 1.png',fit:BoxFit.fill ,),
                ),
                onTap: (){  Navigator.pushNamed(context, "/productInfo",arguments:widget.product );},
              ) ,
             ),
           ),
           Expanded(
            flex:2 ,
            child:Padding(
            padding:EdgeInsets.symmetric(horizontal:20,),
            child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(
                  widget.product.productName,
                  style: AppTextStyle.bold14,
                  maxLines:1,
                  overflow:TextOverflow.ellipsis,
                  ),
                SizedBox(height:3,),
                Text(
                widget.product.barcode,
                style:AppTextStyle.greyBold8
                ),
              SizedBox(height:7,),
          if(widget.product.voteStatus==null)
                Row(
                children: [
                  IconWithValue(backgroundIcon:AppColors.lightGreen, imagePath: 'assets/images/ok.png', containerH:22, containerW:38,
                   imageH:16 ,imageW: 16,value:widget.product.positiveVotes ,function:(context){dialog(context,ColumnPosative(product:widget.product,));} ,
                   borderColor:AppColors.lightGreen ,
                   ),
                    SizedBox(width: 5,),
                     IconWithValue(backgroundIcon:AppColors.pinck, imagePath: 'assets/images/ok.png', containerH:22, containerW:38,
                  imageH:16 ,imageW: 16,value:widget.product.negativeVotes,function:(context){dialog(context,ColumnNagitive(product:widget.product ,));} ,
                  borderColor:AppColors.pinck ,
                  ),
                ],
                )
          else if(widget.product.voteStatus =="SAFE")
               Row(
                children: [
                  IconWithValue(backgroundIcon:AppColors.lightGreen, imagePath: 'assets/images/ok.png', containerH:22, containerW:38,
                   imageH:18 ,imageW: 18,value:widget.product.positiveVotes ,function:(context){dialog(context,ColumnPosative(product:widget.product,));} ,
                   borderColor:Colors.green ,
                   ),
                    SizedBox(width: 7,),
                     IconWithValue(backgroundIcon:AppColors.pinck, imagePath: 'assets/images/ok.png', containerH:22, containerW:38,
                  imageH:16 ,imageW: 16,value:widget.product.negativeVotes,function:(context){dialog(context,ColumnNagitive(product:widget.product ,));} ,
                  borderColor:AppColors.pinck ,
                  ),
                ],
                )
          else if (widget.product.voteStatus=="UNSAFE")
           Row(
                children: [
                  IconWithValue(backgroundIcon:AppColors.lightGreen, imagePath: 'assets/images/ok.png', containerH:22, containerW:38,
                   imageH:16 ,imageW: 16,value:widget.product.positiveVotes ,function:(context){dialog(context,ColumnPosative(product:widget.product,));} ,
                   borderColor:AppColors.lightGreen ,
                   ),
                    SizedBox(width: 7,),
                     IconWithValue(backgroundIcon:AppColors.pinck, imagePath: 'assets/images/ok.png', containerH:22, containerW:38,
                  imageH:18 ,imageW: 18,value:widget.product.negativeVotes,function:(context){dialog(context,ColumnNagitive(product:widget.product ,));} ,
                  borderColor:Colors.pink ,
                  ),
                ],
                )
             
            ]),

            ))
          ],),
          
        ),
         SizedBox(height: 3,),
        Divider(color:AppColors.lightGrey ,thickness:2),
      ],
    );
  }
}