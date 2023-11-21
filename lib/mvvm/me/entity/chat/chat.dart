import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required int id,
    required String title,
    required DateTime createdAt,
    String? description,
    DateTime? updatedAt,
  }) = _Chat;
}
