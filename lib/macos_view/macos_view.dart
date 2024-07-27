import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_ui/macos_view/mac_os_home.dart';

class MacOSView extends StatelessWidget {
  const MacOSView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MacosApp(
      title: 'TempBox',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: MacOsHome(),
    );
  }
}
