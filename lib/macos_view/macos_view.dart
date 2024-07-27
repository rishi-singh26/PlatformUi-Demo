import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Divider, ThemeMode;
import 'package:macos_ui/macos_ui.dart';

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

class MacOsHome extends StatelessWidget {
  const MacOsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    return MacosWindow(
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
        builder: (context, scrollController) => SidebarItems(
          currentIndex: 0,
          onChanged: (i) {},
          scrollController: scrollController,
          items: const [
            SidebarItem(leading: MacosIcon(CupertinoIcons.tray, size: 15), label: Text('Folder One')),
            SidebarItem(leading: MacosIcon(CupertinoIcons.tray, size: 15), label: Text('Folder Two')),
          ],
        ),
      ),
      child: const SelectedFolderView(),
    );
  }
}

class SelectedFolderView extends StatefulWidget {
  const SelectedFolderView({super.key});

  @override
  State<SelectedFolderView> createState() => _SelectedFolderViewState();
}

class _SelectedFolderViewState extends State<SelectedFolderView> {
  double ratingValue = 0;
  double capacitorValue = 0;
  double sliderValue = 0.3;

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: ToolBar(
        title: Builder(builder: (context) => const Text("Folder One")),
        actions: [
          ToolBarIconButton(
            icon: const MacosIcon(CupertinoIcons.share),
            onPressed: () {},
            label: 'Share',
            showLabel: false,
            tooltipMessage: 'Share note',
          ),
          ToolBarIconButton(
            icon: const MacosIcon(CupertinoIcons.trash),
            onPressed: () {},
            label: 'Delete',
            showLabel: false,
            tooltipMessage: 'Delete note',
          ),
        ],
      ),
      children: [
        ResizablePane(
          minSize: 200,
          startSize: 300,
          windowBreakpoint: 700,
          resizableSide: ResizableSide.right,
          builder: (context, scrollcontroller) {
            return ListView.separated(
              controller: scrollcontroller,
              itemCount: 20,
              itemBuilder: (ctx, index) => MacosListTile(title: Text('Note ${index + 1}'), subtitle: const Text('note data')),
              separatorBuilder: (context, index) => const Divider(indent: 15, endIndent: 15, thickness: 0, height: 0),
            );
          },
        ),
        ContentArea(builder: (context, scrollController) => const Center(child: Text('Note Data'))),
      ],
    );
  }
}
