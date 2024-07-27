import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_ui/macos_view/selected_folder_view.dart';
import 'package:platform_ui/macos_view/sidebar_view.dart';

class MacOsHome extends StatelessWidget {
  const MacOsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    return PlatformMenuBar(
      menus: const [
        PlatformMenu(
          label: 'Platform UI',
          menus: [
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.about,
            ),
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.quit,
            ),
          ],
        ),
        PlatformMenu(
          label: 'View',
          menus: [
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.toggleFullScreen,
            ),
          ],
        ),
        PlatformMenu(
          label: 'Window',
          menus: [
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.minimizeWindow,
            ),
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.zoomWindow,
            ),
          ],
        ),
      ],
      child: MacosWindow(
        sidebar: Sidebar(
          top: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
            child: CupertinoListTile(
              title: Text('New Folder', style: typography.body),
              trailing: MacosIcon(
                CupertinoIcons.add_circled_solid,
                size: 18,
                color: CupertinoColors.systemGrey.resolveFrom(context),
              ),
              backgroundColor: CupertinoColors.systemGrey2.resolveFrom(context).withAlpha(44),
              backgroundColorActivated: CupertinoColors.systemGrey4.resolveFrom(context),
              onTap: () {},
            ),
          ),
          minWidth: 240,
          maxWidth: 270,
          builder: (context, scrollController) => SidebarView(scrollController: scrollController),
        ),
        child: const SelectedFolderView(),
      ),
    );
  }
}
