// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import 'attachment_bar.dart';

class TextFieldChatBar extends StatelessWidget {
   const TextFieldChatBar({super.key, required this.sendMassage, required this.myController, required this.sendFile, required this.showAttachmentBar, required this.receiverId, required this.receiverType,  });
  final Function sendMassage;
  final Function sendFile;
  final bool showAttachmentBar;
  final TextEditingController myController ;
   final String receiverId;
   final String receiverType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
            visible: showAttachmentBar,
            child: AttachmentBar(receiverId: receiverId, receiverType: receiverType,)),
        Container(
          width:MediaQuery.of(context).size.width,
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
                  child: Row(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: TextField(

                                controller: myController,
                                cursorColor: kDarkBlueColor,
                                autocorrect: false,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration:   const InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:  TextStyle(
                                      fontSize: 14,
                                      color: kDarkBlueColor,
                                    ),


                                    hintText: "type a message")
                            )),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: (){sendFile();FocusScope.of(context).unfocus();},
                              child:const Icon(Icons.attach_file,color: kDarkBlueColor,),
                            ),
                            InkWell(
                                onTap: (){sendMassage(myController.text);myController.clear();FocusScope.of(context).unfocus();},
                                child:const Icon(Icons.send,color: kDarkBlueColor,),
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
      ],
    );
  }
}
