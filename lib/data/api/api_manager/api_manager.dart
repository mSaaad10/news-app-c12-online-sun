import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/articles_response.dart';
import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sun/data/api/model/sources_response/sources_response.dart';
import 'package:news_app_c12_online_sun/result.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=be69a84c535c43928fdad67c7cd21548
class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'be69a84c535c43928fdad67c7cd21548';

// sports
   Future<Result<List<Source>>> getSources(String categoryId) async {
    Uri uri = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });
    try {
      var response = await http.get(uri); // Uri
      //String bodyString = response.body;
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'ok') {
        return Success(data: sourcesResponse.sources ?? []);
      } else {
        return ServerError(
            code: sourcesResponse.code ?? '',
            message: sourcesResponse.message ?? '');
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  Future<Result<List<Article>>> getArticles(String sourceId) async {
    Uri url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
    });
    try {
      http.Response serverResponse = await http.get(url); //
      Map<String, dynamic> json = jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'ok') {
        return Success(data: articlesResponse.articles ?? []);
      } else {
        return ServerError(
            code: articlesResponse.code ?? '',
            message: articlesResponse.message ?? '');
      }
    } on Exception catch (ex) {
      return Error(exception: ex);
    }
  }
}
