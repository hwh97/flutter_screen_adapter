import 'dart:ui';

import 'package:flutter/widgets.dart';

Widget screenAdapterBuilder({
  required WidgetBuilder? builder,
  required Size designSize,
  Size? tabletDesignSize,
}) {
  return _MediaQueryBuilder(
    builder: builder!,
    designSize: designSize,
    tabletDesignSize: tabletDesignSize,
  );
}

/// rewrite MediaQueryData
class _MediaQueryBuilder extends StatefulWidget {
  final WidgetBuilder builder;

  /// The size of the device screen in the design draft
  final Size designSize;

  /// The size of the tablat screen in the design draft
  final Size? tabletDesignSize;

  const _MediaQueryBuilder({
    Key? key,
    required this.builder,
    required this.designSize,
    this.tabletDesignSize,
  }) : super(key: key);

  @override
  State<_MediaQueryBuilder> createState() => _MediaQueryBuilderState();
}

class _MediaQueryBuilderState extends State<_MediaQueryBuilder> {
  /// Get is tablet
  bool get isTablet {
    return MediaQuery.of(context).size.shortestSide >= 550;
  }

  /// Design width
  double get designWidth {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var designWidth =
        isLandscape ? widget.designSize.height : widget.designSize.width;

    if (widget.tabletDesignSize != null && isTablet) {
      designWidth = isLandscape
          ? widget.tabletDesignSize!.height
          : widget.tabletDesignSize!.width;
    }
    return designWidth;
  }

  /// Scale size
  Size get scaleSize => Size(designWidth, scaleHeight);

  /// New device pixel ratio
  double get devicePixelRatio => window.physicalSize.width / designWidth;

  /// New height by new [devicePixelRatio]
  double get scaleHeight => window.physicalSize.height / devicePixelRatio;

  /// devicePixelRatio Ratio
  double get devicePixelRatioRatio =>
      MediaQuery.of(context).devicePixelRatio / devicePixelRatio;

  /// new padding
  EdgeInsets get padding {
    final padding = MediaQuery.of(context).padding;
    return padding * devicePixelRatioRatio;
  }

  /// new viewInsets
  EdgeInsets get viewInsets {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets * devicePixelRatioRatio;
  }

  /// new viewPadding
  EdgeInsets get viewPadding {
    final viewPadding = MediaQuery.of(context).viewPadding;
    return viewPadding * devicePixelRatioRatio;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: designWidth,
          height: scaleHeight,
          child: Builder(
            builder: widget.builder,
          ),
        ),
      ),
      data: MediaQuery.of(context).copyWith(
        size: scaleSize,
        devicePixelRatio: devicePixelRatio,
        padding: padding,
        viewInsets: viewInsets,
        viewPadding: viewPadding,
      ),
    );
  }
}
