import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/core/di.dart';
import 'package:news_app_c12_online_sun/data_model/category_DM.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_state.dart';
import 'package:news_app_c12_online_sun/presentation/common/error_state_widget.dart';
import 'package:news_app_c12_online_sun/presentation/common/loading_state_widget.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/sources/viewModel/sources_viewModel.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/sources/widgets/sources_tab/sources_tab.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.categoryDM});

  final CategoryDM categoryDM;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  // ToDo injectable
  // tapped item in gridView
  var viewModel = SourcesViewModel(sourcesUseCase: getSourcesUserCase());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.backEndId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              return SourcesTab(sources: state.data);
            case ErrorState():
              return ErrorStateWidget(
                error: state.error,
                serverError: state.serverError,
                retryButtonText: 'retry',
                retryButtonAction: () {
                  viewModel.getSourcesByCategoryId(widget.categoryDM.backEndId);
                },
              );
            case LoadingState():
              return LoadingStateWidget(
                loadingMessage: 'Plz, wait...',
              );
          }
        },
      ),
    );
  }
}

// MyApp
// Home
//Register
//Login

/// HTTP
/// HTTP Request
///    BaseUrl/EndPoint/Arguments
///    Request Type
///     - GET request: BaseUrl/EndPoint/Arguments
///     - POST Request: BaseUrl/EndPoint/ (Body)
/// HTTP Response
/// Body (Json)
///
