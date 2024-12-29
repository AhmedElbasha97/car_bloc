import 'dart:io';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:video_compress/video_compress.dart';
import '../../features/home/data/messages_list_model.dart';
import '../../features/home/data/response_model.dart';

import '../constants/backend_endpoints.dart';
import 'api_service.dart';

class ChatServices{
  static ApiService api = ApiService();

  static Future<List<MessagesListModel>?>getMessagesList(String receiverId,String receiverType,) async {
    List<MessagesListModel>?chatList = [];
    var data = await api.request(Services.getMessageListEndPoint, "POST",queryParamters: {
      "user2_id": "4",
      "user2_type": "TEACHER",
      "user1_id": "1",
      "user1_type":"STUDENT",
    });
    if (data != null) {
      for(var chatData  in data){
        chatList.add(MessagesListModel.fromJson(chatData));
      }
      return chatList;
    }
    return null;
  }
  static Future<ResponseModel?>sendMessage(String receiverId,String receiverType,String textMessage,File? messageFile,String msgType) async {


    File? compressedFile;

     if(msgType == "VID"){
       MediaInfo? mediaInfo = await VideoCompress.compressVideo(
         messageFile?.path??"",
      quality: VideoQuality.LowQuality,
      deleteOrigin: false, // It's false by default
    );
     compressedFile = File(mediaInfo?.file?.path??"");
     }

    final formData = dio.FormData.fromMap({
      "recip_id":receiverId,
      "recip_type":receiverType,
      "msg_text":textMessage,
      "msg_file":messageFile?.path.isEmpty??true?null:
      msgType == "VID"?await await dio.MultipartFile.fromFile(compressedFile?.path??"", filename: messageFile?.path.split('/').last??""):
      await await dio.MultipartFile.fromFile(messageFile?.path??"", filename: messageFile?.path.split('/').last??""),
      "msg_type": msgType,
      "sender_id":"4",
      "sender_type":"TEACHER",
    });
    var data = await api.request(Services.sendMessageEndPoint, "POST",data: formData);
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
}