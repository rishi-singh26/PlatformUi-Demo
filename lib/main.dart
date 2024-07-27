import 'dart:io';

import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_ui/android_app_view/android_app_view.dart';
import 'package:platform_ui/ios_view/ios_view.dart';
import 'package:platform_ui/macos_view/macos_view.dart';
import 'package:platform_ui/win_view/win_view.dart';
import 'package:window_manager/window_manager.dart';

/// This method initializes macos_window_utils and styles the window.
Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
}

Future<void> _configureWindowSize({Size minSize = const Size(1000, 550)}) async {
  await WindowManager.instance.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    size: minSize,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    minimumSize: minSize,
    windowButtonVisibility: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions).then((_) async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setPreventClose(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  switch (Platform.operatingSystem) {
    case 'macos':
      _configureMacosWindowUtils();
      runApp(const MacOSView());
      break;
    case 'windows':
      _configureWindowSize();
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
