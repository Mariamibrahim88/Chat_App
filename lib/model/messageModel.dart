import 'package:scholar_chat_app/const.dart';

class MessageModel {
  final String message;
  final String id;

  MessageModel(this.message, this.id);

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      jsonData[kmessage],
      jsonData['id'],
    );
  }
}
