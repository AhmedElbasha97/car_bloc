import 'dart:io';
import 'package:car_project/features/home/presentation/views/message_list/widget/video_chat_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/constants/backend_endpoints.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../data/messages_list_model.dart';


class VideoChattingCell extends StatefulWidget {
    const VideoChattingCell({super.key, required this.sender, this.message});
  final bool sender;
  final MessagesListModel? message;


  @override
  State<VideoChattingCell> createState() => _VideoChattingCellState();
}

class _VideoChattingCellState extends State<VideoChattingCell> {
   late  VideoPlayerController videoPlayerController;

   callPhone() async {
     final Uri launchUri = Uri(
       scheme: 'tel',
       path: widget.message?.text??"",
     );
     await launchUrl(launchUri);
   }

   chatThroughtWhatsApp() async {
     var androidUrl = "whatsapp://send?phone=${ widget.message?.text??""}&text=${'hi \n أهلا'}";
     var iosUrl = "https://wa.me/${ widget.message?.text??""}?text=${Uri.parse('hi \n أهلا')}";
     try{
       if(Platform.isIOS){
         await launchUrl(Uri.parse(iosUrl));
       }
       else{
         await launchUrl(Uri.parse(androidUrl));
       }
     } on Exception{

     }

   }



   String returnDateAndTime(String? date){
     String dateOrTime = "" ;
     final format = DateFormat('HH:mm a');
     DateFormat formatDate = DateFormat("MMM dd");
     final dateTime = DateTime.parse(date??"");
     if(dateTime.day == DateTime.now().day){
       dateOrTime = format.format(dateTime);
     }else{
       dateOrTime = formatDate.format(dateTime);
     }
     return dateOrTime;
   }



   detectPhoneNumber(String message) {
     RegExp phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');

     if (phoneRegex.hasMatch(message)) {

       return true;
     }

     return false;
   }

   copyTextToClipBoard(BuildContext context) async {
     await Clipboard.setData( ClipboardData(text: widget.message?.text??""));
     final scaffoldMessenger = ScaffoldMessenger.of(context);
     scaffoldMessenger.showSnackBar(
         const SnackBar(
           content: Row(
             children: [
               Icon(Icons.check,color: Colors.white,
                 size: 20,),
               SizedBox(width: 20,),
               Text(
                 "تم نسخ الرساله بنجاح",
                 style:  TextStyle(
                   fontSize: 12,
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ],
           ),
           backgroundColor:Colors.green,
         ));
   }
   @override
   void initState() {

       videoPlayerController =
       VideoPlayerController.network("${Services.baseUrl}${widget.message?.file??""}")
         ..initialize().then((_) {
           setState(() {

           });
         });
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            widget.sender? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              InkWell(
                onLongPress: (){
                  if(widget.message?.text?.isNotEmpty??false) {
                    copyTextToClipBoard(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width*0.85),

                  decoration: BoxDecoration(
                      color: widget.sender? kBlueColor:kYellowColor ,
                      borderRadius: BorderRadius.only(
                        bottomRight:  Radius.circular(widget.sender? 12 : 0),
                        bottomLeft:  const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        topLeft: Radius.circular(widget.sender ? 0 : 12),
                      )),
                  child: Column(
                    children: [
                      VideoChatWidget(videoPlayerController: videoPlayerController,videoPlayer:"${Services.baseUrl}${widget.message?.file??""}",),
                      const SizedBox(height: 10,),
                      detectPhoneNumber(widget.message?.text??"")?Text(
                          widget.message?.text??"",
                          style: widget.sender? TextStyle(

                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white,
                          ): TextStyle(

                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: kDarkBlueColor,
                          )
                      ):
                      Linkify(
                        text:
                        widget.message?.text??"",
                        onOpen: (link) async {
                          if (!await launchUrl(Uri.parse(link.url))) {
                            throw Exception('Could not launch ${link.url}');
                          }
                        },
                        linkStyle: widget.sender? TextStyle(

                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                        ): TextStyle(

                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: kDarkBlueColor,
                        ),
                        style: widget.sender? TextStyle(

                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                        ): TextStyle(

                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: kDarkBlueColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment:
              widget.sender? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Text(
                  returnDateAndTime(widget.message?.date??""),
                  style: TextStyle(

                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.black26,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}