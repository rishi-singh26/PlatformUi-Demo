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
      home: SizedBox.shrink(),
    );
  }
}
