import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:window_manager/window_manager.dart';

class WinView extends StatelessWidget {
  const WinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FluentApp(
        title: 'TempBox',
        debugShowCheckedModeBanner: false,
        darkTheme: FluentThemeData(brightness: Brightness.dark),
        home: const WinHome(),
      );
    });
  }
}

class WinHome extends StatelessWidget {
  const WinHome({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        leading: const FlutterLogo(),
        title: const DragToMoveArea(child: Align(alignment: AlignmentDirectional.centerStart, child: Text('TempBox'))),
        actions: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Tooltip(
            message: 'Share message',
            child: IconButton(icon: const Icon(FluentIcons.share, size: 20), onPressed: () {}),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Delete message',
            child: IconButton(icon: const Icon(CupertinoIcons.trash, size: 20), onPressed: () {}),
          ),
          const SizedBox(width: 10),
          const WindowButtons(),
        ]),
      ),
      pane: NavigationPane(
        header: Card(
          margin: const EdgeInsets.only(right: 15, left: 8, bottom: 15),
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text('New Address', style: FluentTheme.of(context).typography.body),
            trailing: const Icon(CupertinoIcons.add_circled_solid),
            onPressed: () {},
          ),
        ),
        onItemPressed: (index) {},
        size: NavigationPaneSize(openWidth: MediaQuery.of(context).size.width / 5, openMinWidth: 250, openMaxWidth: 250),
        items: [
          PaneItem(icon: const Icon(CupertinoIcons.tray), title: const Text('Folder One'), body: const SizedBox.shrink()),
          PaneItem(icon: const Icon(CupertinoIcons.tray), title: const Text('Folder Two'), body: const SizedBox.shrink()),
        ],
        displayMode: PaneDisplayMode.open,
        toggleable: true,
        selected: 0,
      ),
      paneBodyBuilder: (item, child) {
        final name = item?.key is ValueKey ? (item!.key as ValueKey).value : null;
        return FocusTraversalGroup(key: ValueKey('body$name'), child: const SelectedNoteView());
      },
    );
  }
}

class SelectedNoteView extends StatelessWidget {
  const SelectedNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 280,
          child: ScaffoldPage(
            padding: const EdgeInsets.symmetric(vertical: 2),
            content: Builder(builder: (context) {
              return ListView.separated(
                itemCount: 20,
                itemBuilder: (ctx, index) => ListTile(title: Text('Note ${index + 1}'), subtitle: const Text('note data')),
                separatorBuilder: (context, index) => const Divider(),
              );
            }),
          ),
        ),
        const Divider(direction: Axis.vertical),
        const Expanded(child: ScaffoldPage(padding: EdgeInsets.symmetric(vertical: 3), content: Center(child: Text('Note data')))),
      ],
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(brightness: theme.brightness, backgroundColor: Colors.transparent),
    );
  }
}
