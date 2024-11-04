import '/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: "C-Bill",
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/axis': (context) => AxisScreen(),
        '/amex': (context) => AmexScreen(),
        '/aubank': (context) => AubankScreen(),
        '/icici': (context) => IciciScreen(),
        '/idfc': (context) => IdfcScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
