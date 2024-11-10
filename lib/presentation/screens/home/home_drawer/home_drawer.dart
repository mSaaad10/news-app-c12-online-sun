import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sun/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';

typedef OnMenuItemClicked = void Function(MenuItem);

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onMenuItemClicked});

  OnMenuItemClicked onMenuItemClicked;

  // static const int categories = 0;
  // static const int settings = 1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 110.h,
              color: ColorsManager.green,
              child: Text(
                'News App!',
                style: AppStyles.drawerTitle,
              )),
          Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onMenuItemClicked(MenuItem.categories);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 33.sp,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Categories',
                        style: AppStyles.drawerItem,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.w,
                ),
                InkWell(
                  onTap: () {
                    onMenuItemClicked(MenuItem.settings);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 33.sp,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Settings',
                        style: AppStyles.drawerItem,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum MenuItem {
  categories, // 0
  settings, // 1
}
