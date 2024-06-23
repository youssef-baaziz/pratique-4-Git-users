import 'package:flutter/material.dart';
import 'package:flutter_app_4/bloc/them.bloc.dart';
import 'package:flutter_app_4/ui/pages/counter.bloc.page.dart';
import 'package:flutter_app_4/ui/pages/counter.stateful.page.dart';
import 'package:flutter_app_4/ui/pages/git.users.page.dart';
import 'package:flutter_app_4/ui/pages/home.page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyrouteView extends StatelessWidget {
  const MyrouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        theme: state.themeData,
        routes: {
          '/': (context) => const HomePage(),
          '/counter-stateful': (context) => const CounterStatefulPage(),
          '/counter-bloc': (context) => const CounterBlocPage(),
          '/git-users': (context) => const GitUsersPage(),
        },
        initialRoute: '/',
      );
    });
  }
}
