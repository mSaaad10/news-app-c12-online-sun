import 'package:news_app_c12_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c12_online_sun/result.dart';

abstract class SourcesRepository {
  // this function will be change ToDo
  Future<Result<List<SourceEntity>>> getSources(String categoryId);
}
