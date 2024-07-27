import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class SidebarView extends StatelessWidget {
  final ScrollController scrollController;
  const SidebarView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SidebarItems(
      currentIndex: 0,
      onChanged: (i) {},
      scrollController: scrollController,
      items: const [
        SidebarItem(
          leading: MacosIcon(CupertinoIcons.tray, size: 15),
          label: Text('Folder One'),
        ),
        SidebarItem(
          leading: MacosIcon(CupertinoIcons.tray, size: 15),
          label: Text('Folder Two'),
        ),
        SidebarItem(
          leading: MacosIcon(CupertinoIcons.tray, size: 15),
          label: Text('Folder Three'),
        ),
        SidebarItem(
          leading: MacosIcon(CupertinoIcons.tray, size: 15),
          label: Text('Folder Four'),
        )
      ],
    );
  }
}
