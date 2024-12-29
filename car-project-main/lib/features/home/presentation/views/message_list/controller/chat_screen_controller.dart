import 'dart:async';
import 'dart:io';


import 'package:cool_alert/cool_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/services/chat_services.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../data/messages_list_model.dart';
import '../../../../data/response_model.dart';



class ChatScreenController extends GetxController{
List<MessagesListModel>? chatList = [];
bool isLoading = true;
final String receiverId;
final String receiverType;
final TextEditingController msgController =  TextEditingController();
FilePickerResult? pickedFile;
String choosenFileIndex = "0";
Timer? timer;
bool appBarDataIsLoading = true;
bool showAttachmentBar = false;
bool choosedImageFile = false;
bool choosedVideoFile = false;
bool choosedPDFFile = false;
late String? employeeData ;
ImageSource videoSrc = ImageSource.gallery;
ImageSource imageSrc = ImageSource.gallery;
final ImagePicker _picker = ImagePicker();
final picker = ImagePicker();
final List<File> _videos = [];
XFile? video;
final List<File> imagesFile = [];
XFile? image;
late  VideoPlayerController videoPlayerSelectorController;
  ChatScreenController(this.receiverId, this.receiverType);
@override
  void onInit() {
  getData();
  getAppBarData();
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) => getData());
  }
@override
  onClose() {
  timer?.cancel();
}
//image
showImageSourceSelector(BuildContext context) async {
    bool? done = await selectPhotoSrc(context);
    print("$done hdsfibghdisubgfiudsuibfi");
    if (done??true) {
      if(image?.path == null) {
        await getImages(context);
        update();
      }else{
        await editingImage(context);
        update();
      }
    }
    update();
  }
Future<bool?> selectPhotoSrc(BuildContext context) async {
    bool? done = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          title: Center(
            child:
            Text(
             "Choose image source",
              textAlign: TextAlign.center,
              style: TextStyle(

                  color: kBlueColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.camera_alt,color: kBlueColor,),
                      Text(
                        "camera",
                        textAlign: TextAlign.center,
                        style: TextStyle(

                            color: kBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  onPressed: () {
                    imageSrc = ImageSource.camera;
                    Navigator.pop(context, true);
                  },
                ),
                MaterialButton(
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.photo,color: kBlueColor,),
                     Text(
                        "gallery",
                        textAlign: TextAlign.center,
                        style: TextStyle(

                            color: kBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  onPressed: () {
                    imageSrc = ImageSource.gallery;
                    Navigator.pop(context, true);
                  },
                )
              ],
            ),
          ],
        ));
    return done;
  }
Future<void> getImageFromUserThroughCamera() async {
  image = await _picker.pickImage(source: ImageSource.camera);
  update();
}
Future<void> getImageFromUserThroughGallery() async {
  image = await _picker.pickImage(source: ImageSource.gallery);
  update();
}
Future<void> getImages(BuildContext context)  async {
  if (imageSrc == ImageSource.camera) {
    await getImageFromUserThroughCamera();
    update();
  } else {
    await getImageFromUserThroughGallery();
    update();
  }
  if (image != null) {
    {
      choosedPDFFile = false;
      choosedVideoFile = false;
      choosedImageFile = true;
        imagesFile.add(File(image?.path??""));
      }
    }else{

  }
    update();
  }
editingImage(BuildContext context) async {
  if (imageSrc == ImageSource.camera) {
    await getImageFromUserThroughCamera();
    update();
  } else {
    await getImageFromUserThroughGallery();
    update();
  }
  if(image != null){
  if(imagesFile[0] != File(image?.path ?? "")) {
    choosedPDFFile = false;
    choosedVideoFile = false;
    choosedImageFile = true;
    imagesFile[0] = File(image?.path ?? "");
    print("hiiiiiii edit");
    update();
  }else{

  }
  }else{

  }

  update();
}
deleteImage(){
  choosedPDFFile = false;
  choosedVideoFile = false;
  choosedImageFile = false;
  imagesFile.removeAt(0);
  update();
}
//-------------------------------------------------------------
//videos
Future<void> getVideoFromUserThroughCamera() async {
    video = await _picker.pickVideo(source: ImageSource.camera);
    update();
  }
Future<void> getVideoFromUserThroughGallery() async {
    video = await _picker.pickVideo(source: ImageSource.gallery);
    update();
  }
getVideo(BuildContext context) async {
  if (videoSrc == ImageSource.camera) {
    await getVideoFromUserThroughCamera();
    update();
  } else {
    await getVideoFromUserThroughGallery();
    update();
  }
  if (video != null) {
    if (_videos.isEmpty) {
      choosedPDFFile = false;
      choosedVideoFile = true;
      choosedImageFile = false;
      print('in add');
      _videos.add(File(video!.path));
      print(video!.path);
      videoPlayerSelectorController =
      VideoPlayerController.file(File(video!.path))
        ..initialize().then((_) {
          update();
        });

    }
  }else{


  }
}
editVideo(BuildContext context) async {
  if (videoSrc == ImageSource.camera) {
    await getVideoFromUserThroughCamera();
    update();
  } else {
    await getVideoFromUserThroughGallery();
    update();
  }
  if (video != null) {
    if(_videos[0] != File(video!.path)) {
      choosedPDFFile = false;
      choosedVideoFile = true;
      choosedImageFile = false;
  print('in insert');
  _videos[0] = File(video!.path);
  print(video!.path);

      videoPlayerSelectorController =
  VideoPlayerController.file(File(video!.path))
    ..initialize().then((_) {
      update();
    });
    }else{

    }
  }else{

}
  }
deleteVideo(){
  choosedPDFFile = false;
  choosedVideoFile = false;
  choosedImageFile = false;
  _videos.removeAt(0);
  update();
}
Future<bool?> selectVideoSrc(BuildContext context) async {
  bool? done = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: Center(
          child:
         Text(
           "Select video source",
            textAlign: TextAlign.center,
            style: TextStyle(

                color: kBlueColor,
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ),),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.camera_alt,color: kBlueColor,),
                    Text(
                    "camera",
                      textAlign: TextAlign.center,
                      style: TextStyle(

                          color: kBlueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  ],
                ),
                onPressed: () {
                  videoSrc = ImageSource.camera;
                  Navigator.pop(context, true);
                },
              ),
              MaterialButton(
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.photo,color: kBlueColor,),
                   Text(
                      "gallery",
                      textAlign: TextAlign.center,
                      style: TextStyle(

                          color: kBlueColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  ],
                ),
                onPressed: () {
                  videoSrc = ImageSource.gallery;
                  Navigator.pop(context, true);
                },
              )
            ],
          ),
        ],
      ));
  return done;
}
showVideoSourceSelector(BuildContext context) async {
  bool? done = await selectVideoSrc(context);
  print("$done hdsfibghdisubgfiudsuibfi");
  if (done??true) {
    if(video?.path == null) {
      await getVideo(context);
      update();
    }else{
      await editVideo(context);
      update();
    }
  }
  update();
}
//-------------------------------------------------------------
//files
void pickFile(BuildContext context) async {
    final result = await  FilePicker.platform.pickFiles(allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result == null){

    }else{
      pickedFile = result;
      print(pickedFile?.count??0);
      choosedPDFFile = true;
      choosedVideoFile = false;
      choosedImageFile = false;
      choosenFileIndex = "1";
      update();
    }


  }
void editPickedFile(BuildContext context) async {
    final result = await  FilePicker.platform.pickFiles(allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result == null){

    }else{
      if(pickedFile != result){
      pickedFile = result;
      print(pickedFile?.count??0);
      choosedPDFFile = true;
      choosedVideoFile = false;
      choosedImageFile = false;
      choosenFileIndex = "1";
      update();
      }else{

      }
    }


  }
removePickedFile(){
  choosedPDFFile = false;
  choosedVideoFile = false;
  choosedImageFile = false;
  pickedFile?.files.removeAt(0);
  update();
  }
showFileSelector(BuildContext context) async {

  if(pickedFile?.files[0].path == null) {
     pickFile(context);
        update();
      }else{
         editPickedFile(context);
        update();
      }
    }

//-------------------------------------------------------------
getAppBarData() async {
  appBarDataIsLoading = false;
  update();
}
getData() async {

   chatList = await ChatServices.getMessagesList("1", "STUDENT");
   isLoading = false;
   update();
}
detectWhoWroteTheMessage( senderId){
  bool theUserIsSender = false;
  var employeeId = "4";
  if(
  senderId == employeeId
  ){
    theUserIsSender = true;
  }
  return theUserIsSender;
}
showingAttachmentBar(){
  showAttachmentBar = !showAttachmentBar;
  update();
}
sendMessage(context) async {
   ResponseModel? status = await ChatServices.sendMessage(receiverId,receiverType,msgController.text,choosedPDFFile?File(pickedFile?.files[0].path??""):choosedVideoFile?File(_videos[0].path??""):choosedImageFile?File(imagesFile[0].path??""):null,choosedPDFFile?"FIL":choosedVideoFile?"VID":choosedImageFile?"IMG":"TXT");
  if(status?.msg=="succeeded"){
    showAttachmentBar = false;
    choosedPDFFile = false;
    choosedVideoFile = false;
    choosedImageFile = false;
  getData();
  }else{
    update();

  }
}
}
