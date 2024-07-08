import 'package:mindlee_demo/src/domain/entities/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessages();
  Future<void> likeMessage(String id, bool liked);
}
