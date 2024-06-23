import 'package:flutter/material.dart';

class MyDrawerItem extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final String route;
  const MyDrawerItem({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: TextStyle(color: Colors.black),
      leading: leadingIcon,
      trailing: trailingIcon,
      title: Text("$title"),
      iconColor: Theme.of(context).primaryColor,
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
    );
  }
}
