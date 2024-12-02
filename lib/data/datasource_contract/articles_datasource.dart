import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/result.dart';

abstract class ArticlesDataSource {
  Future<Result<List<Article>>> getArticles(String sourceId);
}
