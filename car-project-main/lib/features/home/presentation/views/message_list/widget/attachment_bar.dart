import 'dart:io';

import 'package:car_project/features/home/presentation/views/message_list/widget/selector_image_widget.dart';
import 'package:car_project/features/home/presentation/views/message_list/widget/video_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../controller/chat_screen_controller.dart';
import 'file_selector_widget.dart';

class AttachmentBar extends StatelessWidget {
  const AttachmentBar({super.key, required this.receiverId, required this.receiverType});
  final String receiverId;
  final String receiverType;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
      init: ChatScreenController(receiverId,receiverType),
      builder: (controller) =>  Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height*0.24,
        decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20),),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 1),
          ],
        ),
        child: Padding(
          padding:  const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.9,

              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height*0.25),
                child:controller.choosedPDFFile?
                FileSelectorWidget(file:File(controller.pickedFile?.files[0].path??""),chooseAnotherFile: () {controller.showFileSelector(context);}, deleteFile: () {controller.removePickedFile();},) :controller.choosedVideoFile?VideoSelectorWidget(chooseAnotherVideo: () {
                  controller.showVideoSourceSelector(context);
                }, deleteVideo: () {controller.deleteVideo();}, videoPlayerController: controller.videoPlayerSelectorController,):controller.choosedImageFile?SelectorImageWidget(images:controller.imagesFile[0],chooseAnotherImage: () {
                  controller.showImageSourceSelector(context);
                }, deleteImage: () {controller.deleteImage();},):
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width*0.9,

                      decoration: BoxDecoration(
                        color: Color(0xffDEEAFD),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffDEEAFD),width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                controller.showingAttachmentBar();
                              },
                              child: Icon(Icons.close,color: kDarkBlueColor,),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        controller.showVideoSourceSelector(context);
                                      },
                                      child: Container(
                                        width: Get.width*0.17,
                                        height: Get.height*0.08,
                                        decoration: BoxDecoration(
                                          border: Border.all( color:kLightBlueColor,width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              offset: const Offset(
                                                0.0,
                                                0.0,
                                              ),
                                              blurRadius: 13.0,
                                              spreadRadius: 2.0,
                                            ), //BoxShadow
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ), //BoxShadow
                                          ],
                                          color: kDarkBlueColor
                                          ,shape: BoxShape.circle,
                                        ),
                                        child:  const Center(
                                          child:  Icon(
                                            Icons.video_camera_back_rounded,
                                            weight: 30,
                                            color: kLightBlueColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "video",
                                      style:  TextStyle(

                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: kDarkBlueColor,
                                      )
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        controller.showImageSourceSelector(context);
                                      },
                                      child: Container(
                                        width: Get.width*0.17,
                                        height: Get.height*0.08,
                                        decoration: BoxDecoration(
                                          border: Border.all( color:kLightBlueColor,width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              offset: const Offset(
                                                0.0,
                                                0.0,
                                              ),
                                              blurRadius: 13.0,
                                              spreadRadius: 2.0,
                                            ), //BoxShadow
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ), //BoxShadow
                                          ],
                                          color: kDarkBlueColor
                                          ,shape: BoxShape.circle,
                                        ),
                                        child:  const Center(
                                          child:  Icon(
                                            Icons.image,
                                            weight: 30,
                                            color: kLightBlueColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                 Text(
                                      "photo",
                                      style:  TextStyle(

                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: kDarkBlueColor,
                                      )
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        controller.showFileSelector(context);
                                      },
                                      child: Container(
                                        width: Get.width*0.17,
                                        height: Get.height*0.08,
                                        decoration: BoxDecoration(
                                          border: Border.all( color:kLightBlueColor,width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              offset: const Offset(
                                                0.0,
                                                0.0,
                                              ),
                                              blurRadius: 13.0,
                                              spreadRadius: 2.0,
                                            ), //BoxShadow
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ), //BoxShadow
                                          ],
                                          color: kDarkBlueColor
                                          ,shape: BoxShape.circle,
                                        ),
                                        child:  const Center(
                                          child:  Icon(
                                            Icons.document_scanner_sharp,
                                            weight: 30,
                                            color: kLightBlueColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                 Text(
                                     "File",
                                      style:  TextStyle(

                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: kDarkBlueColor,
                                      )
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
