// //events = actions
// import 'package:bloc/bloc.dart';

// abstract class CounterEvent {}

// class IncrementCounterEvent extends CounterEvent {}

// class DecrementCounterEvent extends CounterEvent {}

// // state

// abstract class CounterState {
//   final int counter;

//   CounterState({
//     required this.counter,
//   });
// }

// class CounterSuccessState extends CounterState {
//   CounterSuccessState({required int counter}) : super(counter: counter);
// }

// class CounterErrorState extends CounterState {
//   final String errorMsg;

//   CounterErrorState({required int counter, required this.errorMsg})
//       : super(counter: counter);
// }

// class CounterInitialState extends CounterState {
//   CounterInitialState() : super(counter: 0);
// }

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterInitialState()) {
//     on((IncrementCounterEvent event, emit) {
//       int counterValue = state.counter;
//       if (counterValue < 10) {
//         emit(CounterSuccessState(counter: counterValue + 1));
//       } else {
//         emit(
//           CounterErrorState(
//               counter: counterValue,
//               errorMsg: "counter value can not exceed 10"),
//         );
//       }
//     });
//     on((DecrementCounterEvent event, emit) {
//       int counterValue = state.counter;
//       if (counterValue > 0) {
//         emit(CounterSuccessState(counter: counterValue - 1));
//       } else {
//         emit(
//           CounterErrorState(
//               counter: counterValue,
//               errorMsg: "counter value can't be less than 0"),
//         );
//       }
//     });
//   }
// }

import 'package:bloc/bloc.dart';

// Events
abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

// State
abstract class CounterState {
  final int counter;

  CounterState({required this.counter});
}

class CounterSuccessState extends CounterState {
  CounterSuccessState({required int counter}) : super(counter: counter);
}

class CounterErrorState extends CounterState {
  final String errorMsg;

  CounterErrorState({required int counter, required this.errorMsg})
      : super(counter: counter);
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(counter: 0);
}

// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<IncrementCounterEvent>((event, emit) {
      int counterValue = state.counter;
      if (counterValue < 10) {
        emit(CounterSuccessState(counter: counterValue + 1));
      } else {
        emit(
          CounterErrorState(
              counter: counterValue,
              errorMsg: "Counter value cannot exceed 10"),
        );
      }
    });

    on<DecrementCounterEvent>((event, emit) {
      int counterValue = state.counter;
      if (counterValue > 0) {
        emit(CounterSuccessState(counter: counterValue - 1));
      } else {
        emit(
          CounterErrorState(
              counter: counterValue,
              errorMsg: "Counter value cannot be less than 0"),
        );
      }
    });
  }
}
