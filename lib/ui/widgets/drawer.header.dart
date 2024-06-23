import 'package:flutter/material.dart';
import 'package:flutter_app_4/bloc/them.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/lufy.jpeg"),
            radius: 50,
          ),
          IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(SwitchthemeEvent());
              },
              icon: Icon(Icons.settings))
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.black,
          Theme.of(context).primaryColor,
        ],
      )),
    );
  }
}
