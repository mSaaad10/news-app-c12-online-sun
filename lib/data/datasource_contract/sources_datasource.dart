import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sun/result.dart';

abstract class SourcesDataSource {
  Future<Result<List<Source>>> getSources(String categoryId);
}
