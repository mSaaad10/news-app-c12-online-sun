import 'package:news_app_c12_online_sun/domain/entities/source_entity.dart';
import 'package:news_app_c12_online_sun/domain/usecases/get_sources_usecase.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_state.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_viewModel.dart';
import 'package:news_app_c12_online_sun/result.dart';

class SourcesViewModel extends BaseViewModel<List<SourceEntity>> {
  GetSourcesUseCase sourcesUseCase;

  SourcesViewModel({required this.sourcesUseCase});

  void getSourcesByCategoryId(String categoryId) async {
    emit(LoadingState(loadingMessage: 'Plz, wait...'));
    var result = await sourcesUseCase.execute(categoryId);
    switch (result) {
      case Success<List<SourceEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<SourceEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<SourceEntity>>():
        emit(ErrorState(error: result));
    }
  }
}
