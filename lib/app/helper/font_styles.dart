import 'package:flutter/material.dart';
import 'package:watch_now/app/helper/font.dart';

class FontStyles {
  static TextStyle get title => TextStyle(
        color: Colors.black,
        fontSize: FontSize.title,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get headline => TextStyle(
        color: Colors.black,
        fontSize: FontSize.headline,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get calloutDisplay => TextStyle(
        color: Colors.black,
        fontSize: FontSize.callout,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get calloutText => TextStyle(
        color: Colors.black,
        fontSize: FontSize.callout,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get calloutTextReguler => TextStyle(
        color: Colors.black,
        fontSize: FontSize.callout,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get subheadlineBold => TextStyle(
        color: Colors.black,
        fontSize: FontSize.subheadline,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get subheadlineMedium => TextStyle(
        color: Colors.black,
        fontSize: FontSize.subheadline,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get paragraph => TextStyle(
        color: Colors.black,
        fontSize: FontSize.paragraph,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get captionDisplayMedium => TextStyle(
        color: Colors.black,
        fontSize: FontSize.caption,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get captionTextBold => TextStyle(
        color: Colors.black,
        fontSize: FontSize.caption,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get captionTextRegular => TextStyle(
        color: Colors.black,
        fontSize: FontSize.caption,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get captionTextStrikeTrough => TextStyle(
        color: Colors.black,
        decoration: TextDecoration.lineThrough,
        fontSize: FontSize.caption,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get smallBold => TextStyle(
        color: Colors.black,
        fontSize: FontSize.small,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get smallText => TextStyle(
        color: Colors.black,
        fontSize: FontSize.small,
        fontWeight: FontWeight.w400,
      );
}
