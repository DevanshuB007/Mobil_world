import 'package:flutter/material.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/Magic_Box/magic_box.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/dashbord.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/intro_Page/intro_page.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/sidebar.dart';
import 'package:gaytri_mobile/merchant_login/merchant_login.dart';
import 'package:gaytri_mobile/Registration_screen/registration.dart';
import 'package:gaytri_mobile/Splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF17A589)),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Splashscreen(),
      // home: IntroPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Text('Gaytri Mobile'),
    );
  }
}
