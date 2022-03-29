import 'dart:collection';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '/src/screen_util.dart';

/// rewrite runApp
runAdapterApp(Widget app) {
  ScreenAdapterBinding.ensureInitialized()!
    ..scheduleAttachRootWidget(app)
    ..scheduleWarmUpFrame();
}

/// rewrite WidgetsFlutterBinding
class ScreenAdapterBinding extends WidgetsFlutterBinding {
  final Queue<PointerEvent> _pendingPointerEvents = Queue<PointerEvent>();

  ScreenAdapterBinding();

  static WidgetsBinding? ensureInitialized() {
    if (WidgetsBinding.instance == null) {
      ScreenAdapterBinding();
    }
    return WidgetsBinding.instance;
  }

  @override
  void initInstances() {
    super.initInstances();
    window.onPointerDataPacket = _handlePointerDataPacket;
  }

  @override
  ViewConfiguration createViewConfiguration() {
    return ViewConfiguration(
      size: Size(
        ScreenUtil.designWidth,
        ScreenUtil.adapterHeight,
      ),
      devicePixelRatio: ScreenUtil.adapterPixelRatio,
    );
  }

  void _handlePointerDataPacket(PointerDataPacket packet) {
    // We convert pointer data to logical pixels so that e.g. the touch slop can be
    // defined in a device-independent manner.
    _pendingPointerEvents.addAll(PointerEventConverter.expand(
      packet.data,
      ScreenUtil.adapterPixelRatio,
    ));
    if (!locked) _flushPointerEventQueue();
  }

  void _flushPointerEventQueue() {
    assert(!locked);
    while (_pendingPointerEvents.isNotEmpty) {
      handlePointerEvent(_pendingPointerEvents.removeFirst());
    }
  }
}
