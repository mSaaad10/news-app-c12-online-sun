import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_state.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_viewModel.dart';
import 'package:news_app_c12_online_sun/result.dart';

class ArticlesViewViewModel extends BaseViewModel<List<Article>> {
  void getArticlesBySourceId(String sourceId) async {
    emit(LoadingState());
    var result = await ApiManager.getArticles(sourceId);
    switch (result) {
      case Success<List<Article>>():
        emit(SuccessState(data: result.data));

      case ServerError<List<Article>>():
        emit(ErrorState(serverError: result));

      case Error<List<Article>>():
        emit(ErrorState(error: result));
    }
  }
}
