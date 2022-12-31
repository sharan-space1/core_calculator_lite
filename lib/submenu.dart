import 'package:core_calculator_lite/detailpage.dart';
import 'package:flutter/material.dart';

class SubMenu extends StatefulWidget {
  const SubMenu({super.key, required Map this.menu});
  final Map menu;
  @override
  State<SubMenu> createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
  ListTile buildSubMenuTile(Map subMenu) {
    return ListTile(
      title: Text(subMenu['title']),
      trailing: const Icon(Icons.navigate_next),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DetailPage(subMenu: subMenu);
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu['title']),
      ),
      body: ListView.builder(
        itemCount: widget.menu['subMenu'].length,
        itemBuilder: (context, index) {
          return buildSubMenuTile(widget.menu['subMenu'][index]);
        },
      ),
    );
  }
}
