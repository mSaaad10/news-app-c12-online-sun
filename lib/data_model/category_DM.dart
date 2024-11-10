import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/core/utils/assets_manager.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:news_app_c12_online_sun/core/utils/constant_manager.dart';
import 'package:news_app_c12_online_sun/core/utils/strings_manager.dart';

class CategoryDM {
  String backEndId;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDM(
      {required this.backEndId,
      required this.title,
      required this.bgColor,
      required this.imagePath});

  static List<CategoryDM> getCategoriesList() => [
        CategoryDM(
            backEndId: ConstantManager.sportsBakEndId,
            title: StringsManager.sports,
            bgColor: ColorsManager.red,
            imagePath: AssetsManager.sports),
        CategoryDM(
            backEndId: ConstantManager.generalBakEndId,
            title: StringsManager.general,
            bgColor: ColorsManager.darkBlue,
            imagePath: AssetsManager.general),
        CategoryDM(
            backEndId: ConstantManager.healthBakEndId,
            title: StringsManager.health,
            bgColor: ColorsManager.pink,
            imagePath: AssetsManager.health),
        CategoryDM(
            backEndId: ConstantManager.businessBakEndId,
            title: StringsManager.business,
            bgColor: ColorsManager.brown,
            imagePath: AssetsManager.business),
        CategoryDM(
            backEndId: ConstantManager.entertainmentBakEndId,
            title: StringsManager.entertainment,
            bgColor: ColorsManager.blue,
            imagePath: AssetsManager.entertainment),
        CategoryDM(
            backEndId: ConstantManager.scienceBakEndId,
            title: StringsManager.science,
            bgColor: ColorsManager.yellow,
            imagePath: AssetsManager.science),
        CategoryDM(
            backEndId: ConstantManager.techBakEndId,
            title: StringsManager.tech,
            bgColor: ColorsManager.green,
            imagePath: AssetsManager.tech),
      ];
}
