import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "usama";
    return Scaffold(
      appBar: AppBar(
        title: Text("PUBG SHOP"),
      ),
      body: Center(
        child: Container(
          child: Text("working for $days days by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
