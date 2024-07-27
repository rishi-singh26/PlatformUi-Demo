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
      home: const SizedBox.shrink(),
    );
  }
}
