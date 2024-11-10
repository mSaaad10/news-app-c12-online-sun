import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';

class AppStyles {
  static final TextStyle appBar = GoogleFonts.exo(
      fontSize: 22.sp, fontWeight: FontWeight.w400, color: ColorsManager.white);
  static final TextStyle drawerTitle = GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static final TextStyle drawerItem = GoogleFonts.poppins(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManager.blackAccent);
  static final TextStyle picCategory = GoogleFonts.poppins(
      fontSize: 22.sp, fontWeight: FontWeight.w700, color: ColorsManager.grey);
  static final TextStyle categoryTitle = GoogleFonts.exo(
      fontSize: 22.sp, fontWeight: FontWeight.w400, color: ColorsManager.white);
}
