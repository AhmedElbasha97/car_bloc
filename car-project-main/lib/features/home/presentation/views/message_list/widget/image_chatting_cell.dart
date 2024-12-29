import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'dart:math';

import '../../../../../../core/constants/backend_endpoints.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../data/messages_list_model.dart';

class ImageChattingCell extends StatelessWidget {
   ImageChattingCell({super.key, required this.sender, required this.message,});
  final bool sender;
   final MessagesListModel? message;

  late SampleItem? selectedItem = SampleItem.itemOne;

   var random = Random();
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
     RegExp phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');

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
   Future<void> _saveImage(BuildContext context,String url) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    String message = '';

    try {
      // Download image
      final http.Response response = await http.get(
          Uri.parse(url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);
      print(finalPath);
      if (finalPath != null) {
        message = 'Image saved to gallery';
        scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check,color: Colors.white,
                    size: 20,),
                  const SizedBox(width: 20,),
                  Text(
                    message,
                    style:  const TextStyle(
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
    } catch (e) {
      message = e.toString();
      scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.close,color: Colors.white,
                  size: 20,),
                const SizedBox(width: 20,),
                Text(
                  message,
                  style:  const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            backgroundColor:Colors.red,
          ));
    };
    print(message);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            sender? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              InkWell(
                onLongPress: (){
                  if(message?.text?.isNotEmpty??false) {
                    copyTextToClipBoard(context);
                  }
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
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap:(){

                            },
                            child:CachedNetworkImage(
                              imageUrl:"${Services.baseUrl}${message?.file??""}",
                              imageBuilder: ((context, image) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: Get.height * 0.4,
                                    width: Get.width * 0.5,
                                    decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: kGrayColor,
                                          blurRadius: 2,
                                          offset:
                                          Offset(1, 1), // Shadow position
                                        ),
                                      ],
                                      image: DecorationImage(
                                        image: image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              placeholder: (context, image) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(
                                                  15))),
                                      child: Container(
                                        height: Get.height * 0.4,
                                        width: Get.width * 0.5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFDFDDDF),
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:   kBlueColor.withAlpha(55))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                          .slide()),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  height: Get.height * 0.4,
                                  width: Get.width * 0.9,
                                  margin:
                                  const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration:  const BoxDecoration(
                                    color: kDarkBlueColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kGrayColor,
                                        blurRadius: 2,
                                        offset:
                                        Offset(1, 1), // Shadow position
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/no_data_slideShow.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 5,
                            child: PopupMenuButton<SampleItem>(
                              icon:const Icon(Icons.keyboard_control,color: kDarkBlueColor,),
                              initialValue: selectedItem,
                              onSelected: (SampleItem item) {
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                                PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemOne,
                                  onTap: (){
                                    _saveImage( context,"${Services.baseUrl}${message?.file??""}",);

                                  },
                                  child: Row(
                                    children: [
                                      const Icon(Icons.save_alt_outlined,color: kDarkBlueColor,
                                        size: 30,),
                                      const SizedBox(width: 10,),
                                      Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        "Save the Image",
                                        style: TextStyle(
                                          shadows: <Shadow>[
                                            Shadow(
                                                offset:  const Offset(0.5, 0.5),
                                                blurRadius: 0.5,
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                          ],
                                          fontSize: 15,
                                          letterSpacing: 0,

                                          color: kDarkBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      detectPhoneNumber(message?.text??"")?Text(
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
enum SampleItem { itemOne, itemTwo, itemThree }