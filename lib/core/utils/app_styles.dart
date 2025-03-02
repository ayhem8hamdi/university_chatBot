import 'package:flutter/material.dart';
import 'package:university_chatbot/core/utils/constants.dart';

abstract class AppStyles {
  static TextStyle style14Regular(
    BuildContext context, {
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 14),
      fontWeight: FontWeight.normal,
      fontFamily: kfontFamily,
      color: color,
      height: height,
    );
  }

  static TextStyle style11Regular(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 11),
      fontWeight: FontWeight.normal,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style16Regular(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 16),
      fontWeight: FontWeight.normal,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style18Regular(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 18),
      fontWeight: FontWeight.normal,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style16Medium(BuildContext context,
      {Color? color, double? height}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 16),
      fontWeight: FontWeight.w500,
      fontFamily: kfontFamily,
      height: height,
      color: color,
    );
  }

  static TextStyle style13Medium(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 13),
      fontWeight: FontWeight.w500,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style19Medium(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 19),
      fontWeight: FontWeight.w500,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style13SemiBold(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 13),
      fontWeight: FontWeight.w600,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style16SemiBold(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 16),
      fontWeight: FontWeight.w600,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style18SemiBold(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 18),
      fontWeight: FontWeight.w600,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style20SemiBold(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 20),
      fontWeight: FontWeight.w600,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style24ExtraBold(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 24),
      fontWeight: FontWeight.w800,
      fontFamily: kfontFamily,
      color: color,
    );
  }

  static TextStyle style30ExtraBold(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontsize: 30),
      fontWeight: FontWeight.w800,
      color: color,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontsize}) {
  double scaleFactor = getScaleFactor(fontsize, context);
  double responsiveFontSize = fontsize * scaleFactor;

  double lowerLimit = fontsize * 0.5;
  double upperLimit = fontsize * 1.3;

  responsiveFontSize = responsiveFontSize.clamp(lowerLimit, upperLimit);

  return responsiveFontSize;
}

double getScaleFactor(double fontsize, BuildContext context) {
  var width = MediaQuery.sizeOf(context).width;

  if (width < 600) {
    return width / 380;
  } else {
    return width / 800;
  }
}
