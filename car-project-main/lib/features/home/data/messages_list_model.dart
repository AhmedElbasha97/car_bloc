
import 'dart:convert';

List<MessagesListModel> messagesListModelFromJson(String str) => List<MessagesListModel>.from(json.decode(str).map((x) => MessagesListModel.fromJson(x)));

String messagesListModelToJson(List<MessagesListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessagesListModel {
  int? id;
  int? sender;
  String? text;
  String? type;
  String? file;
  String? view;
  String? date;

  MessagesListModel({
    this.id,
    this.sender,
    this.text,
    this.type,
    this.file,
    this.view,
    this.date,
  });

  factory MessagesListModel.fromJson(Map<String, dynamic> json) => MessagesListModel(
    id: json["id"],
    sender: json["sender"],
    text: json["text"],
    type: json["type"],
    file: json["file"],
    view: "${json["view"]}",
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender": sender,
    "text": text,
    "type": type,
    "file": file,
    "view": "$view",
    "date": date,
  };
}


