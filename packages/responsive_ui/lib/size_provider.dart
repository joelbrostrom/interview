import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_ui/main.dart';

class SizeProvider extends ChangeNotifier {
  SizeProvider() {
    _updateSize();
    WidgetsBinding.instance.addObserver(_WindowSizeObserver(this));
  }

  ResponsiveSize _currentSize = ResponsiveSize.small;

  ResponsiveSize get currentSize => _currentSize;

  void _updateSize() {
    final width =
        MediaQueryData.fromView(
          PlatformDispatcher.instance.views.first,
        ).size.width;

    ResponsiveSize newSize;
    if (width < ResponsiveSize.small.widthBreakpoint) {
      newSize = ResponsiveSize.small;
    } else if (width < ResponsiveSize.medium.widthBreakpoint) {
      newSize = ResponsiveSize.medium;
    } else if (width < ResponsiveSize.large.widthBreakpoint) {
      newSize = ResponsiveSize.large;
    } else {
      newSize = ResponsiveSize.extraLarge;
    }

    if (newSize != _currentSize) {
      _currentSize = newSize;
      notifyListeners();
    }
  }
}

class _WindowSizeObserver with WidgetsBindingObserver {
  final SizeProvider sizeProvider;

  _WindowSizeObserver(this.sizeProvider);

  @override
  void didChangeMetrics() {
    sizeProvider._updateSize();
  }
}
