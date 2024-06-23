import 'package:flutter/material.dart';
import 'package:flutter_app_4/bloc/counter.bloc.dart';
import 'package:flutter_app_4/bloc/them.bloc.dart';
import 'package:flutter_app_4/bloc/users.bloc.dart';
import 'package:flutter_app_4/ui/pages/route.view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CounterBloc()),
      BlocProvider(create: (context) => ThemeBloc()),
      BlocProvider(create: (context) => UsersBloc()),
    ], child: const MyrouteView());
  }
}
