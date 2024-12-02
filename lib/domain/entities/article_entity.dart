import 'package:news_app_c12_online_sun/domain/entities/source_entity.dart';

class ArticleEntity {
  final String? title;
  final SourceEntity? source;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity(
      {this.title,
      this.source,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}
