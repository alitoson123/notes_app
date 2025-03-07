import 'package:flutter/material.dart';
import 'package:notes_app/Views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xff323233),
          fontFamily: 'Poppins',
          ),
      home: HomeView(),
    );
  }
}
