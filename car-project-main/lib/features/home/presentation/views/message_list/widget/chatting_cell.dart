// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../data/messages_list_model.dart';

import 'image_chatting_cell.dart';
class ChattingCell extends StatelessWidget {
    ChattingCell({super.key, required this.sender,  this.message, });
  final bool sender;
  final MessagesListModel? message;

  late SampleItem? selectedItem = SampleItem.itemOne;

  callPhone() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: message?.text??"",
    );
    await launchUrl(launchUri);
  }

  chatThroughtWhatsApp() async {
    var androidUrl = "whatsapp://send?phone=${ message?.text??""}&text=${'hi \n أهلا'}";
    var iosUrl = "https://wa.me/${ message?.text??""}?text=${Uri.parse('hi \n أهلا')}";
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
      RegExp phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{12}$');

      if (phoneRegex.hasMatch(message)) {

        return true;
      }

      return false;
    }

    copyTextToClipBoard(BuildContext context) async {
      await Clipboard.setData( ClipboardData(text: message?.text??""));
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment:
                sender? MainAxisAlignment.end : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  InkWell(
                    onLongPress: (){
                      copyTextToClipBoard( context);

                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width*0.6),

                      decoration: BoxDecoration(
                          color: sender? kBlueColor:kYellowColor ,
                          borderRadius: BorderRadius.only(
                            bottomRight:  Radius.circular(sender? 12 : 0),
                            bottomLeft:  const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            topLeft: Radius.circular(sender ? 0 : 12),
                          )),
                      child:detectPhoneNumber(message?.text??"")?Text(
                          message?.text??"",
                          style: sender? TextStyle(

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
                        message?.text??"",
                        onOpen: (link) async {
                          if (!await launchUrl(Uri.parse(link.url))) {
                            throw Exception('Could not launch ${link.url}');
                          }
                        },
                        linkStyle: sender? TextStyle(

                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                        ): TextStyle(

                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: kDarkBlueColor,
                        ),
                        style: sender? TextStyle(

                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                        ): TextStyle(

                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: kDarkBlueColor,
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment:
              sender? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
              Text(
                returnDateAndTime(message?.date??""),
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
