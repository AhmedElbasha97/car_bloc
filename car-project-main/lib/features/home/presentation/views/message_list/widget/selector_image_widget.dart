import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/app_colors.dart';


class SelectorImageWidget extends StatelessWidget {
  const SelectorImageWidget({super.key, this.images, required this.chooseAnotherImage, required this.deleteImage});
  final File? images ;
  final VoidCallback chooseAnotherImage;
  final VoidCallback deleteImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
            child: DecoratedBox(

                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 6,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child:Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Image.file(
                      width: Get.width*0.7,
                      height: Get.height*0.25,
                      images!,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
            )),

        Positioned(
          top: 5,
          left: 5,
          child: InkWell(
            onTap: (){
              chooseAnotherImage();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:kDarkBlueColor
              ),
              child: const Center(
                child: Icon(Icons.edit,color: kWhiteColor,),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child:InkWell(
            onTap: (){
              deleteImage();
            },

            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:kDarkBlueColor
              ),
              child: const Center(
                child: Icon(Icons.delete_outline,color: kWhiteColor,),
              ),
            ),
          ),

        ),

      ],
    );
  }
}
