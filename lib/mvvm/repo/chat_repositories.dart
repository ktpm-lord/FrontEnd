import 'package:fit_life/core/components/network/app_exception.dart';
import 'package:fit_life/mvvm/me/entity/message/message.dart';

abstract class ChatRepositories {
  Future<SResult<List<Message>>> getMessage({int? chatId});

  Future<SResult<String>> sendMessage({required List<String> message});

  Future<bool> clearConversationI();

  Future<bool> deleteMessage({required String messageId});
}
