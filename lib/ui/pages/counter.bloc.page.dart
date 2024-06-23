import 'package:flutter/material.dart';
import 'package:flutter_app_4/bloc/counter.bloc.dart';
import 'package:flutter_app_4/ui/themes/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "counter bloc",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterSuccessState || state is CounterInitialState) {
              return Text('counter value => ${state.counter}');
            } else if (state is CounterErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('counter value => ${state.counter}'),
                  Text(
                    state.errorMsg,
                    style: MyAppTheme.errorTextStyle,
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "incr",
            child: Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            heroTag: "decr",
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
          )
        ],
      ),
    );
  }
}
