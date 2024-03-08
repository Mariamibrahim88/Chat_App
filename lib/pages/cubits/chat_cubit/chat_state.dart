part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {
  List<MessageModel> messageList;
  ChatSuccess({required this.messageList});
}

final class ChatFailure extends ChatState {
  String errMessage;
  ChatFailure({required this.errMessage});
}
