import 'dart:io';
import 'dart:math';

import 'package:file_icon/file_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/app_colors.dart';


class FileSelectorWidget extends StatefulWidget {
  const FileSelectorWidget({super.key, this.file, required this.chooseAnotherFile, required this.deleteFile});
  final File? file ;
  final VoidCallback chooseAnotherFile;
  final VoidCallback deleteFile;

  @override
  State<FileSelectorWidget> createState() => _FileSelectorWidgetState();
}

class _FileSelectorWidgetState extends State<FileSelectorWidget> {
  String fileSize = "";
@override
void initState() {
  super.initState();
  getFileSize(widget.file?.path??"",1);


}
  getFileName(String filePath){
    return filePath.split('/').last;
  }

   getFileSize(String filepath, int decimals) async {
     var file = File(filepath);
     int bytes = await file.length();
     if (bytes <= 0) return "0 B";
     const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
     var i = (log(bytes) / log(1024)).floor();
     fileSize =
     '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
     setState(() {

     });
   }
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
                  child:  Container(
                    width: Get.width*0.8,
                    height: Get.height*0.13,
                    decoration: BoxDecoration(
                        color: kLightBlueColor,
                        borderRadius: BorderRadius.circular(20)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 15,),
                                  Container(
                                    width: Get.width*0.5,
                                    child: Text(
                                        getFileName(widget.file?.path??""),
                                        maxLines: 3,
                                        style:  TextStyle(

                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: kDarkBlueColor,
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                      fileSize,
                                      style:  TextStyle(

                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: kDarkBlueColor,
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10,),
                              FileIcon(widget.file?.path??"", size: 50),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            )),

        Positioned(
          top: 5,
          left: 5,
          child: InkWell(
            onTap: (){
              widget.chooseAnotherFile();
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
              widget.deleteFile();
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
