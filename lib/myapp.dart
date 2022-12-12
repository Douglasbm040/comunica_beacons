import 'package:flutter/material.dart';
import 'screens/listdevice.dart';
import 'screens/chat.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const MyHomePage(),
          '/chat': (_) => const Chat(),
        });
  }
}
