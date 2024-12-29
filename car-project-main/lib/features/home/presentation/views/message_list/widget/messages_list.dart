import 'package:car_project/features/home/presentation/views/message_list/widget/pdf_chatting_cell.dart';
import 'package:car_project/features/home/presentation/views/message_list/widget/video_chatting_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/app_colors.dart';

import '../../../../data/messages_list_model.dart';
import '../controller/chat_screen_controller.dart';
import 'chatting_cell.dart';
import 'image_chatting_cell.dart';
class MessagesList extends StatelessWidget {
   const MessagesList({super.key, required this.listOfMessages, required this.receiverId, required this.receiverType});
   final List<MessagesListModel>? listOfMessages ;
   final String receiverId;
   final String receiverType;
   @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
      init: ChatScreenController(receiverId,receiverType),
      builder: (controller) =>  Expanded(
        child: Container(
          padding:  const EdgeInsets.symmetric(horizontal: 10),
          decoration:    const BoxDecoration(
            color: kLightBlueColor,

          ),
          child: ClipRRect(
            borderRadius:  const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child:Padding(
              padding:  const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listOfMessages?.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        listOfMessages?[index].type=="IMG"?ImageChattingCell(message: listOfMessages?[index], sender: controller.detectWhoWroteTheMessage(listOfMessages?[index].sender??0) == ""?true:false,):
                        listOfMessages?[index].type=="VID"?VideoChattingCell(message: listOfMessages?[index], sender: controller.detectWhoWroteTheMessage(listOfMessages?[index].sender??0) == ""?true:false,) :
                        listOfMessages?[index].type=="FIL"?PdfChattingCell(message: listOfMessages?[index], sender: controller.detectWhoWroteTheMessage(listOfMessages?[index].sender??0) == ""?true:false,):
                            ChattingCell(message: listOfMessages?[index], sender: controller.detectWhoWroteTheMessage(listOfMessages?[index].sender??0) == ""?true:false,),


                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
