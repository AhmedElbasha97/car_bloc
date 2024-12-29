import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import 'controller/chat_screen_controller.dart';
import 'widget/loading_message_list_widget.dart';
import 'widget/messages_list.dart';
import 'widget/text_field_chat_bar.dart';

class ChattingScreen extends StatelessWidget {
 final String receiverId;
 final String receiverType;
 final String receiverName;

  const ChattingScreen({super.key, required this.receiverId, required this.receiverType, required this.receiverName});
   @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
      init: ChatScreenController(receiverId,receiverType),
      builder: (controller) => Scaffold(
        appBar:PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppBar(

            iconTheme:   const IconThemeData(color:kLightBlueColor),
            backgroundColor:  Colors.white,
            flexibleSpace:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,50.0,10),
                  child: Row(
                    children: [
                      const SizedBox(width: 40,),
                      InkWell(
                        onTap:(){

                        },
                        child:controller.appBarDataIsLoading?Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                            .slide(): SizedBox(

                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(
                              'https://img.freepik.com/premium-vector/vector-flat-illustration-grayscale-avatar-user-profile-person-icon-profile-picture-business-profile-woman-suitable-social-media-profiles-icons-screensavers-as-templatex9_719432-1310.jpg?w=740',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      controller.appBarDataIsLoading?Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xFFDFDDDF),
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(10))
                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                              .slide(),
                          const SizedBox(height: 10,),
                          Container(
                            width: 200,
                            height: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xFFDFDDDF),
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(10))
                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                              .slide(),
                        ],
                      ): Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                         Text(receiverName,
                            style:  TextStyle(

                                color: kDarkBlueColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
                          ),



                        ],
                      ),

                    ],
                  ),
                ),

              ],
            ),
            centerTitle: false,

            leading: IconButton(
              icon:  const Icon(
                Icons.arrow_back_ios,
                color: kYellowColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [

              //massage list used to display massages
              controller.isLoading?LoadingMessageListWidget():MessagesList( listOfMessages:  controller.chatList,receiverId: receiverId, receiverType: receiverType,),
              //Main widget at the end of screen
             TextFieldChatBar(sendMassage: (value){
               controller.sendMessage(value.toString());

              }, myController:  controller.msgController, sendFile: (){
               controller.showingAttachmentBar();
             }, showAttachmentBar: controller.showAttachmentBar, receiverId:receiverId, receiverType: receiverType,)


            ],
          ),
        ),
      ),
    );
  }


   }


