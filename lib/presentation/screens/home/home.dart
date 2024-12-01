import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/core/utils/assets_manager.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:news_app_c12_online_sun/data_model/category_DM.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/categories/view/categories.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/category_details/view/category_details.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/settings/settings.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = Categories(
      onCategoryClicked: onCategoryClicked,
    );
  }

  late Widget selectedWidget;
  String title = 'News App';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: HomeDrawer(
          onMenuItemClicked: onMenuItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  // void onMenuItemClicked(int pos){
  //   Navigator.pop(context);
  //   if(pos == HomeDrawer.categories){
  //     selectedWidget = Categories();
  //   }else if(pos == HomeDrawer.settings){
  //     selectedWidget = Settings();
  //   }else{
  //
  //   }
  //   setState(() {
  //
  //   });
  // }

  void onCategoryClicked(CategoryDM category) {
    selectedWidget = CategoryDetails(categoryDM: category);
    title = category.title;
    setState(() {});
  }

  void onMenuItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        selectedWidget = Categories(
          onCategoryClicked: onCategoryClicked,
        );
      case MenuItem.settings:
        selectedWidget = Settings();
    }
    Navigator.pop(context);
    setState(() {});
  }
}
