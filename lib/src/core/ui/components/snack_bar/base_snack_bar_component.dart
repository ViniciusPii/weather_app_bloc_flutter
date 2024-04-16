import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/src/core/theme/infra/app_dimension.dart';

class BaseSnackBarComponent {
  BaseSnackBarComponent._();

  static void show(
    BuildContext context, {
    required Widget child,
    double? positionTop,
    double? positionBottom = AppDimension.colossal,
    Duration duration = const Duration(milliseconds: 3000),
  }) {
    dismiss();
    BaseSnackBarComponent._createView(
      context,
      child: child,
      duration: duration,
      positionTop: positionTop,
      positionBottom: positionBottom,
    );
  }

  static late OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static Future<void> _createView(
    BuildContext context, {
    required Widget child,
    required Duration duration,
    double? positionTop,
    double? positionBottom,
  }) async {
    var overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        Future.delayed(duration, dismiss);
        return _ToastOverlayEntryWidget(
          dismiss: dismiss,
          top: positionTop,
          bottom: positionBottom,
          child: child,
        );
      },
    );

    _isVisible = true;

    overlayState.insert(_overlayEntry);
  }

  static Future<void> dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry.remove();
  }
}

class _ToastOverlayEntryWidget extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final AsyncCallback dismiss;

  const _ToastOverlayEntryWidget({
    required this.child,
    this.top,
    this.bottom,
    required this.dismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      width: MediaQuery.of(context).size.width,
      child: Dismissible(
        key: const ValueKey('overlay_toast'),
        direction: DismissDirection.horizontal,
        onDismissed: (_) => dismiss(),
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }
}
