import 'package:fluent_ui/fluent_ui.dart';

class WinView extends StatelessWidget {
  const WinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return const FluentApp(
        title: 'TempBox',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: SizedBox.shrink(),
      );
    });
  }
}
