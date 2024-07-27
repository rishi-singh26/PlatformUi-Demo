import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Divider;
import 'package:macos_ui/macos_ui.dart';

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
        title: Builder(builder: (context) {
          return const Text("Folder One");
        }),
        titleWidth: 150.0,
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
          minSize: 280,
          startSize: 300,
          maxSize: 400,
          windowBreakpoint: 700,
          resizableSide: ResizableSide.right,
          builder: (context, scrollcontroller) {
            return ListView.separated(
              controller: scrollcontroller,
              itemCount: 20,
              itemBuilder: (ctx, index) {
                return MacosListTile(
                  onClick: () {},
                  title: Text('Note ${index + 1}'),
                  subtitle: const Text('Note Subtitle'),
                );
              },
              separatorBuilder: (context, index) => const Divider(indent: 15, endIndent: 15, thickness: 0, height: 0),
            );
          },
        ),
        ContentArea(
          builder: (context, scrollController) {
            return const Center(child: Text('Note Data'));
          },
        ),
      ],
    );
  }
}
