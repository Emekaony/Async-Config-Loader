import 'package:simple_application/models/author.dart';

class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity({
    // even though it is nullable, if u want it to be named then u gotta add it
    this.imageUrl,
    required this.text,
    required this.id,
    required this.createdAt,
    required this.author,
  });
}
