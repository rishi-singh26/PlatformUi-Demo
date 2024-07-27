import 'dart:io';

import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_ui/android_app_view/android_app_view.dart';
import 'package:platform_ui/ios_view/ios_view.dart';
import 'package:platform_ui/macos_view/macos_view.dart';
import 'package:platform_ui/win_view/win_view.dart';

/// This method initializes macos_window_utils and styles the window.
Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
}

void main() {
  switch (Platform.operatingSystem) {
    case 'macos':
      _configureMacosWindowUtils();
      runApp(const MacOSView());
      break;
    case 'windows':
      runApp(const WinView());
      break;
    case 'ios':
      runApp(const IosView());
      break;
    default:
      runApp(const AndroidAppView());
      break;
  }
}
