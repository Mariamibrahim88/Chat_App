import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat_app/model/messageModel.dart';

import '../../../const.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);

  void sendMessage({required String message, required String email}) {
    try {
      messages.add({
        kmessage: message,
        ktime: DateTime.now(),
        'id': email,
      });
    } on Exception catch (e) {
      // TODO
    }
  }

  void getMessage() {
    //stream:
    messages.orderBy(ktime, descending: true).snapshots().listen((event) {
      List<MessageModel> messageList = [];
      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJson(doc));
      }

      emit(ChatSuccess(messageList: messageList));
    });
  }
}
