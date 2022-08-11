import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poc_flavor/pages/firebase_message.dart';

import 'flavors.dart';
import 'pages/my_home_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    FirebaseConfig.init();
  }

  Widget _flavorBanner({required Widget child, bool show = true}) {
    if (show) {
      return Banner(
        location: BannerLocation.topStart,
        message: F.name,
        color: Colors.green.withOpacity(0.6),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
        textDirection: TextDirection.ltr,
        child: child,
      );
    } else {
      return Container(child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _flavorBanner(
        child: const HomePage(),
        show: kDebugMode,
      ),
    );
  }
}
