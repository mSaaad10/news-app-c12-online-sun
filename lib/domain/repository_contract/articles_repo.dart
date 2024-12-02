import 'package:news_app_c12_online_sun/domain/entities/article_entity.dart';
import 'package:news_app_c12_online_sun/result.dart';

abstract class ArticlesRepository {
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId);
}
