import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c12_online_sun/domain/entities/article_entity.dart';

class ArticleItemWidget extends StatelessWidget {
  const ArticleItemWidget({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              article.source?.name ?? '',
              style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF79828B)),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(article.title ?? '',
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF42505C))),
            SizedBox(
              height: 3.h,
            ),
            // Text(article.description ?? '',
            //     style: GoogleFonts.poppins(
            //         fontSize: 10,
            //         fontWeight: FontWeight.w400,
            //         color: Color(0xFF79828B))),
            Text(article.publishedAt ?? '',
                textAlign: TextAlign.end,
                style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA3A3A3)))
          ],
        ),
      ),
    );
  }
}

// design patterns
// singltone
// factory
// builder
