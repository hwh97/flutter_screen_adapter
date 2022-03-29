import 'package:flutter/widgets.dart';
import '/src/screen_util.dart';

Widget mediaQueryBuilder(BuildContext context, Widget? child) {
  return _MediaQueryBuilder(child: child!);
}

/// rewrite MediaQueryData
class _MediaQueryBuilder extends StatelessWidget {
  final Widget child;

  const _MediaQueryBuilder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      child: child,
      data: MediaQuery.of(context).copyWith(
        size: Size(
          ScreenUtil.designWidth,
          ScreenUtil.adapterHeight,
        ),
        devicePixelRatio: ScreenUtil.adapterPixelRatio,
      ),
    );
  }
}
