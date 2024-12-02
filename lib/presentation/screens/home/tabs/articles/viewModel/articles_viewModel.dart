import 'package:news_app_c12_online_sun/domain/entities/article_entity.dart';
import 'package:news_app_c12_online_sun/domain/usecases/get_articles_usecase.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_state.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_viewModel.dart';
import 'package:news_app_c12_online_sun/result.dart';

class ArticlesViewViewModel extends BaseViewModel<List<ArticleEntity>> {
  GetArticlesUseCase articlesUseCase;

  ArticlesViewViewModel({required this.articlesUseCase});

  void getArticlesBySourceId(String sourceId) async {
    emit(LoadingState());
    var result = await articlesUseCase.execute(sourceId);
    switch (result) {
      case Success<List<ArticleEntity>>():
        emit(SuccessState(data: result.data));

      case ServerError<List<ArticleEntity>>():
        emit(ErrorState(serverError: result));

      case Error<List<ArticleEntity>>():
        emit(ErrorState(error: result));
    }
  }
}
