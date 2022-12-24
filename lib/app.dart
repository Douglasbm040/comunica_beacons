import 'package:comunica_beacons/src/screens/comunicationPage.dart';
import 'package:comunica_beacons/src/screens/homepage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
          '/chat': (_) => const ComunicationPage(),
        });
  }
}
