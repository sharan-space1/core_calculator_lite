import 'package:core_calculator_lite/submenu.dart';
import 'package:core_calculator_lite/config.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ListTile buildMenuTile(Map menu) {
    return ListTile(
      title: Text(menu['title']),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return SubMenu(menu: menu);
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CORE Calculator Lite'),
      ),
      drawer: Drawer(
        child: Material(
          child: ListView.builder(
            itemCount: config.length,
            itemBuilder: (context, index) {
              return buildMenuTile(config[index]);
            },
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: Container(
                height: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
