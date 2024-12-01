import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/sources_response/source.dart';

class SourceWidget extends StatelessWidget {
  SourceWidget({super.key, required this.source, required this.isSelected});

  Source source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(6),
      margin: REdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          color: isSelected ? ColorsManager.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: ColorsManager.green,
            width: 2,
          )),
      child: Text(
        source.name ?? '',
        style: GoogleFonts.exo(
            color: isSelected ? ColorsManager.white : ColorsManager.green,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
