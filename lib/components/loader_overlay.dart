import 'package:flutter/material.dart';

class LoaderOverlay {
  static LoaderOverlay? _instance;
  factory LoaderOverlay() => _instance ??= LoaderOverlay._();

  LoaderOverlay._();

  static OverlayEntry? _overlayEntry;

  static OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
