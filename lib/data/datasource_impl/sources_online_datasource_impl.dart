import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sun/data/datasource_contract/sources_datasource.dart';
import 'package:news_app_c12_online_sun/result.dart';

class SourcesApiDataSourceImpl extends SourcesDataSource {
  ApiManager apiManager;

// dependency Injection
  SourcesApiDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Source>>> getSources(String categoryId) async {
    var result = await apiManager.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        return Success(data: result.data);
      case ServerError<List<Source>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Source>>():
        return Error(exception: result.exception);
    }
  }
}

class SourcesFireStoreDataSourceImpl extends SourcesDataSource {
  @override
  Future<Result<List<Source>>> getSources(String categoryId) {
    // TODO: implement getSources
    // u shout get sources list from fire store
    throw UnimplementedError();
  }
}

class SourcesOfflineDataSourceImpl extends SourcesDataSource {
  @override
  Future<Result<List<Source>>> getSources(String categoryId) {
    // TODO: implement getSources
    // us shoud get source list from offline
    throw UnimplementedError();
  }
}

class SourcesMuhammedSaadDataSource extends SourcesDataSource {
  @override
  Future<Result<List<Source>>> getSources(String categoryId) {
    // TODO: implement getSources

    // u should get sources list from muhammed's home
    throw UnimplementedError();
  }
}
