
import 'dart:convert';

class PostModel {
  final int id;
  final String title;
  final String body;
  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
