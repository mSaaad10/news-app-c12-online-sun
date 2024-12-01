import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sun/presentation/common/base_state.dart';
import 'package:news_app_c12_online_sun/presentation/common/error_state_widget.dart';
import 'package:news_app_c12_online_sun/presentation/common/loading_state_widget.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/articles/viewModel/articles_viewModel.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/articles/widget/article_item_widget.dart';
import 'package:provider/provider.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({super.key, required this.source});

  Source source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  var viewModel = ArticlesViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getArticlesBySourceId(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant ArticlesView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (oldWidget.source.id != widget.source.id) {
      viewModel.getArticlesBySourceId(widget.source.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ArticleItemWidget(
                    article: state.data[index],
                  ),
                  itemCount: state.data.length,
                ),
              );
            case ErrorState():
              return ErrorStateWidget(
                error: state.error,
                serverError: state.serverError,
                retryButtonText: 'retry',
                retryButtonAction: () {
                  viewModel.getArticlesBySourceId(widget.source.id ?? '');
                },
              );
            case LoadingState():
              return LoadingStateWidget(
                loadingMessage: 'Loading...',
              );
          }
        },
      ),
    );
  }
}
