import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_state.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_viewModel.dart';
import 'package:news_app_c12_online_sun/result.dart';

class SourcesViewModel extends BaseViewModel<List<Source>> {
  void getSourcesByCategoryId(String categoryId) async {
    emit(LoadingState(loadingMessage: 'Plz, wait...'));
    var result = await ApiManager.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<Source>>():
        emit(ErrorState(serverError: result));
      case Error<List<Source>>():
        emit(ErrorState(error: result));
    }
  }
}
