import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    required this.id, // Используем переданный `id`
    this.title,
    this.explanation,
    this.url,
    this.hdurl,
    this.media_type,
    this.date,
    this.serviceVersion,
    this.locale,
  });

  final String id; // Уникальный идентификатор
  final String? title;
  final String? explanation;
  final String? url;
  final String? hdurl;
  final String? media_type;
  final String? date;
  final String? serviceVersion;
  final String? locale;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as String? ?? const Uuid().v4(), // Сохраняем `id` из JSON или генерируем новый
      title: json['title'] as String?,
      explanation: json['explanation'] as String?,
      url: json['url'] as String?,
      hdurl: json['hdurl'] as String?,
      media_type: json['media_type'] as String?,
      date: json['date'] as String?,
      serviceVersion: json['serviceVersion'] as String?,
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}