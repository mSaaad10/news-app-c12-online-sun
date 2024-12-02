import 'package:news_app_c12_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c12_online_sun/domain/repository_contract/sources_repository.dart';
import 'package:news_app_c12_online_sun/result.dart';

class GetSourcesUseCase {
  SourcesRepository repository;

  GetSourcesUseCase({required this.repository});

  Future<Result<List<SourceEntity>>> execute(String categoryId) {
    return repository.getSources(categoryId);
  }
}
