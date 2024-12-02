import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sun/data/datasource_contract/sources_datasource.dart';
import 'package:news_app_c12_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c12_online_sun/domain/repository_contract/sources_repository.dart';
import 'package:news_app_c12_online_sun/result.dart';

class SourcesRepositoryImpl extends SourcesRepository {
  SourcesDataSource dataSource;

// Dependency Injection;
  SourcesRepositoryImpl({required this.dataSource});

// this function will be change ToDo
  @override
  Future<Result<List<SourceEntity>>> getSources(String categoryId) async {
    var result = await dataSource.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        List<SourceEntity> sources = result.data
            .map(
              (source) => source.toSourceEntity(),
            )
            .toList();
        return Success(data: sources);

      case ServerError<List<Source>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Source>>():
        return Error(exception: result.exception);
    }
  }
}
