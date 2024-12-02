import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/data/datasource_contract/articles_datasource.dart';
import 'package:news_app_c12_online_sun/domain/entities/article_entity.dart';
import 'package:news_app_c12_online_sun/domain/repository_contract/articles_repo.dart';
import 'package:news_app_c12_online_sun/result.dart';

class ArticleRepoImpl extends ArticlesRepository {
  ArticlesDataSource dataSource;

  ArticleRepoImpl({required this.dataSource});

  @override
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId) async {
    var result = await dataSource.getArticles(sourceId);
    switch (result) {
      case Success<List<Article>>():
        List<ArticleEntity> articles =
            result.data.map((article) => article.toArticleEntity()).toList();
        return Success(data: articles);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}
