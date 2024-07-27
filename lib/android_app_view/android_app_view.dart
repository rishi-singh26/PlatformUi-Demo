import 'package:flutter/material.dart';

class AndroidAppView extends StatelessWidget {
  const AndroidAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AndroidHome(),
    );
  }
}

class AndroidHome extends StatelessWidget {
  const AndroidHome({super.key});

  _navigateToNotesList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotesList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(title: Text('Platform UI')),
          SliverList.list(children: [
            ListTile(title: const Text('Folder One'), onTap: () => _navigateToNotesList(context)),
            ListTile(title: const Text('Folder Two'), onTap: () => _navigateToNotesList(context)),
          ])
        ],
      ),
    );
  }
}

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  _navigateToNoteDetail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NoteDetail()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(title: Text('Notes List')),
          SliverList.list(
            children: List.generate(30, (index) {
              return ListTile(title: Text('Note ${index + 1}'), onTap: () => _navigateToNoteDetail(context));
            }),
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
    return const Scaffold(
      body: CustomScrollView(
        slivers: [SliverAppBar.large(title: Text('Note Detail')), SliverToBoxAdapter(child: Center(child: Text('Note data')))],
      ),
    );
  }
}
