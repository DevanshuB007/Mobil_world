import 'package:flutter/material.dart';
import 'package:gaytri_mobile/Drawer_Screen/View/sidebar.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
