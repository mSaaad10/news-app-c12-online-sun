import 'package:news_app_c12_online_sun/domain/entities/article_entity.dart';
import 'package:news_app_c12_online_sun/domain/repository_contract/articles_repo.dart';
import 'package:news_app_c12_online_sun/result.dart';

class GetArticlesUseCase {
  ArticlesRepository repository;

  GetArticlesUseCase({required this.repository});

  Future<Result<List<ArticleEntity>>> execute(String sourceId) {
    return repository.getArticles(sourceId);
  }
}
