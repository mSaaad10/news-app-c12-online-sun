import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/datasource_impl/articles_online_datasource_impl.dart';
import 'package:news_app_c12_online_sun/data/datasource_impl/sources_online_datasource_impl.dart';
import 'package:news_app_c12_online_sun/data/repository_impl/articles_repository_impl.dart';
import 'package:news_app_c12_online_sun/data/repository_impl/sources_repository_impl.dart';
import 'package:news_app_c12_online_sun/domain/usecases/get_articles_usecase.dart';
import 'package:news_app_c12_online_sun/domain/usecases/get_sources_usecase.dart';

SourcesRepositoryImpl getSourcesRepository() {
  return SourcesRepositoryImpl(dataSource: getApiDataSource());
}

SourcesApiDataSourceImpl getApiDataSource() {
  return SourcesApiDataSourceImpl(apiManager: getApiManager());
}

ApiManager getApiManager() {
  return ApiManager();
}

ArticleRepoImpl getArticlesRepository() {
  return ArticleRepoImpl(dataSource: getArticlesDataSource());
}

ArticlesApiDataSourceImpl getArticlesDataSource() {
  return ArticlesApiDataSourceImpl(apiManager: getApiManager());
}

GetSourcesUseCase getSourcesUserCase() {
  return GetSourcesUseCase(repository: getSourcesRepository());
}

GetArticlesUseCase getArticlesUseCase() {
  return GetArticlesUseCase(repository: getArticlesRepository());
}
