import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data_model/category_DM.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/sources/view/sources_view.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return SourcesView(categoryDM: categoryDM);
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
