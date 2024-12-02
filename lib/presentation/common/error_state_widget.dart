import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sun/result.dart';

class ErrorStateWidget extends StatelessWidget {
  ServerError? serverError;
  Error? error;
  String? retryButtonText;
  VoidCallback? retryButtonAction;

  ErrorStateWidget(
      {super.key,
      this.error,
      this.serverError,
      this.retryButtonText,
      this.retryButtonAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(extractError()),
          SizedBox(
            height: 8.h,
          ),
          if (retryButtonText != null)
            ElevatedButton(
                onPressed: () {
                  retryButtonAction?.call();
                },
                child: Text(retryButtonText!))
        ],
      ),
    );
  }

  String extractError() {
    String message = 'Something went wrong';
    if (serverError?.message != null) {
      message = serverError!.message;
      return message;
    }
    if (error?.exception != null) {
      var ex = error!.exception;
      switch (ex) {
        case SocketException():
          message = 'No Internet connection';
        case HttpException():
          message = "Couldn't find the post";
        case FormatException():
          message = 'Bad response format ';
      }
      return message;
    }
    return message;
  }
}

//const -> compile time
// final -> run time
