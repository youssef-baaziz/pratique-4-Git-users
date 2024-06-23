import 'package:flutter/material.dart';
import 'package:flutter_app_4/ui/widgets/drawer.header.dart';
import 'package:flutter_app_4/ui/widgets/drawer.item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> menus = [
      {
        "title": "Home",
        "route": "/",
        "loadingIcon": Icons.home,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Counter Stateful",
        "route": "/counter-stateful",
        "loadingIcon": Icons.countertops,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Counter Bloc",
        "route": "/counter-bloc",
        "loadingIcon": Icons.block,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Git users",
        "route": "/git-users",
        "loadingIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      }
    ];

    return Drawer(
      child: Column(
        children: [
          const MyDrawerHeader(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return MyDrawerItem(
                    title: menus[index]['title'],
                    route: menus[index]['route'],
                    leadingIcon: Icon(menus[index]['loadingIcon']),
                    trailingIcon: Icon(menus[index]['trailingIcon']));
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 6,
                );
              },
              itemCount: menus.length,
            ),
          )
        ],
      ),
    );
  }
}
