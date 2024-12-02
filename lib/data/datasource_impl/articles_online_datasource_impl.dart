import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sun/data/datasource_contract/articles_datasource.dart';
import 'package:news_app_c12_online_sun/result.dart';

class ArticlesApiDataSourceImpl extends ArticlesDataSource {
  ApiManager apiManager;

  ArticlesApiDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Article>>> getArticles(String sourceId) async {
    var result = await apiManager.getArticles(sourceId);
    switch (result) {
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}
