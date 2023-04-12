import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontSize {
  static double get small {
    return ScreenUtil().setHeight(11);
  }

  static double get caption {
    return ScreenUtil().setHeight(12);
  }

  static double get paragraph {
    return ScreenUtil().setHeight(14);
  }

  static double get subheadline {
    return ScreenUtil().setHeight(14);
  }

  static double get callout {
    return ScreenUtil().setHeight(16);
  }

  static double get headline {
    return ScreenUtil().setHeight(18);
  }

  static double get title {
    return ScreenUtil().setHeight(22);
  }

  static double get lineHeight {
    return ScreenUtil().setHeight(1.3);
  }

  static double custom(int fontSize) {
    return ScreenUtil().setHeight(fontSize);
  }

  static double customInWidth(int fontSize) {
    return ScreenUtil().setWidth(fontSize);
  }
}
