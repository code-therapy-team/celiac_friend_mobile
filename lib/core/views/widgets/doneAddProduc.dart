
import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:celus_fe/core/services/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../models/product.dart';
import '../../view_model/searchByName.dart';
import 'customContainerDialog.dart';
import 'customContainrtWithWidget.dart';

class DoneAddProduct extends StatefulWidget {
  const DoneAddProduct({super.key,required this.name});
final String name;
  @override
  State<DoneAddProduct> createState() => _DoneAddProductState();
}

class _DoneAddProductState extends State<DoneAddProduct> {
  @override
  var product;
  Future<Product?>? receivedData()async{
    final result = await SearchByNameVM( apiConsumer: getIt<DioConsumer>(),).get(name: widget.name);
    // final result = await SearchByNameVM(Dio()).get(name: widget.name);
    return result.fold((l){
      return null;
    }, (Product) {
   return product;
    });
  }
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 200, left: 20, right: 20),
      children: [
        Text(
          'إضافة منتج',
          style: AppTextStyle.mainWord,
        ),
        SizedBox(height: 30),
        Center(
          child: Container(
            height: 100,
            width: 100,
            child: ClipRRect(
              child: SvgPicture.asset(
                'assets/images/party-popper.svg',
                fit: BoxFit.fill,
                matchTextDirection: true,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Center(
            child: Text(
          'تم!',
          style: AppTextStyle.bold14,
        )),
        SizedBox(height: 10),
        Center(
            child: Text(
          'شكراً لك! نشرنا المنتج في قائمة المنتجات التي تحتاج إلى مشاركة معلومات من المستخدمين الآخرين حول احتوائها على الجلوتين.',
          style: AppTextStyle.bold12_mediemGrey,
          textAlign: TextAlign.center,
        )),
        SizedBox(height: 8),
        CustomContainer(
          radius: 8,
          paddinHorizental: 15,
          paddingVertical: 0,
          colorBorder: AppColors.greyContainerBorder,
          colorContainer: AppColors.greyContainer,
          widget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                children: [
                  Text('هل تعرف إذا كان هذا المنتج مناسب لمريض السيلياك؟',
                      style: AppTextStyle.bold12_mediemGrey,
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    child: CustomContainer(
                      radius: 8,
                      paddinHorizental: 15,
                      paddingVertical: 0,
                        colorContainer: AppColors.lightGreen,
                        colorBorder: AppColors.lightGreen,
                        widget: Row(
                          children: [
                            Image.asset(
                              'assets/images/ok.png',
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'مناسب لمريض السيلياك',
                              style: AppTextStyle.darkGreen10,
                            )
                          ],
                        )),
                        onTap:(){
                          
                        } ,
                  ),
                  CustomContainer(
                      radius: 8,
                      paddinHorizental: 15,
                      paddingVertical: 0,
                      colorContainer: AppColors.pinck,
                      colorBorder: AppColors.pinck,
                      widget: Row(
                        children: [
                          Image.asset(
                            'assets/images/ok.png',
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'غير مناسب لمريض السيلياك',
                            style: AppTextStyle.darkPinck10,
                          )
                        ],
                      ))
                ],
              )),
        ),
        SizedBox(height: 8),
        Center(
          child: GestureDetector(
            child: CustomContainerDialog(
                height: 29,
                width: 145,
                text: 'إنهاء',
                color: AppColors.darkBlue,
                textStyle: AppTextStyle.bold14_white),
            onTap: () {
              Navigator.pushNamed(context, "/allProductionScreen");
            },
          ),
        )
      ],
    );
  }
}
