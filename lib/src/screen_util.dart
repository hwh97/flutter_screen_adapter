import 'dart:ui';

class ScreenUtil {
  /// Ui design width default is 375
  static double designWidth = 375;

  /// New height by new [adapterPixelRatio]
  static double get adapterHeight => window.physicalSize.height / adapterPixelRatio;

  /// Device Pixel Ratio by [designWidth]
  static double get adapterPixelRatio => window.physicalSize.width / designWidth;

  static void init({required double designWidth}) {
    ScreenUtil.designWidth = designWidth;
  }
}