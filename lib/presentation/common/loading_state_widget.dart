import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors_manager.dart';

class LoadingStateWidget extends StatelessWidget {
  String? loadingMessage;

  LoadingStateWidget({super.key, this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loadingMessage != null) Text(loadingMessage!),
        SizedBox(
          width: 4.w,
        ),
        const Center(
          child: CircularProgressIndicator(
            color: ColorsManager.green,
          ),
        ),
      ],
    );
  }
}
