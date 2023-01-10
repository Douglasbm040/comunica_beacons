import 'package:comunica_beacons/src/modules/chat/page/comunication_page.dart';
import 'package:comunica_beacons/src/modules/home/page/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (_) => const Homepage(),
          '/comunication': (_) => const ComunicationPage(),
        });
  }
}
