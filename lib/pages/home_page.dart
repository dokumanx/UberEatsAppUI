import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_eats_ui/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
    );
  }
}
