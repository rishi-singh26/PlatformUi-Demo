import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosView extends StatelessWidget {
  const IosView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Platform UI',
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      home: IosHome(),
    );
  }
}

class IosHome extends StatelessWidget {
  const IosHome({super.key});

  _navigateToNotesList(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const NotesList()));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(largeTitle: Text('Platform UI')),
          SliverList.list(children: [
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(title: const Text('Folder One'), onTap: () => _navigateToNotesList(context)),
                CupertinoListTile(title: const Text('Folder Two'), onTap: () => _navigateToNotesList(context)),
              ],
            )
          ])
        ],
      ),
    );
  }
}

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  _navigateToNoteDetail(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const NoteDetail()));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(largeTitle: Text('Notes List')),
          SliverList.list(
            children: [
              CupertinoListSection.insetGrouped(
                children: List.generate(30, (index) {
                  return CupertinoListTile(title: Text('Note ${index + 1}'), onTap: () => _navigateToNoteDetail(context));
                }),
              )
            ],
          )
        ],
      ),
    );
  }
}

class NoteDetail extends StatelessWidget {
  const NoteDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [CupertinoSliverNavigationBar(largeTitle: Text('Note Detail')), SliverToBoxAdapter(child: Center(child: Text('Note data')))],
      ),
    );
  }
}
