import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_app_4/model/users.model.dart';
import 'package:flutter_app_4/repository/users.repository.dart';

abstract class UsersEvent {}

class SearchUsersEvent extends UsersEvent {
  final String keyword;
  final int page;
  final int pageSize;
  SearchUsersEvent({
    required this.keyword,
    required this.page,
    required this.pageSize,
  });
}

class NextPageEvent extends SearchUsersEvent {
  NextPageEvent(
      {required String keyword, required int page, required int pageSize})
      : super(keyword: keyword, page: page, pageSize: pageSize);
}

abstract class UsersState {
  final List<User> users;
  final int currentPage;
  final int totalPage;
  final int pageSize;
  final String curentKeyword;

  UsersState(
      {required this.users,
      required this.currentPage,
      required this.totalPage,
      required this.pageSize,
      required this.curentKeyword});
}

class SearchUsersSuccessState extends UsersState {
  SearchUsersSuccessState(
      {required List<User> users,
      required int currentPage,
      required int totalPage,
      required int pageSize,
      required String curentKeyword})
      : super(
          users: users,
          currentPage: currentPage,
          totalPage: totalPage,
          pageSize: pageSize,
          curentKeyword: curentKeyword,
        );
}

class SearchUsersLoadingState extends UsersState {
  SearchUsersLoadingState(
      {required List<User> users,
      required int currentPage,
      required int totalPage,
      required int pageSize,
      required String curentKeyword})
      : super(
          users: users,
          currentPage: currentPage,
          totalPage: totalPage,
          pageSize: pageSize,
          curentKeyword: curentKeyword,
        );
}

class SearchUsersErrorState extends UsersState {
  final String errorMessage;

  SearchUsersErrorState({
    required List<User> users,
    required int currentPage,
    required int totalPage,
    required int pageSize,
    required String curentKeyword,
    required this.errorMessage,
  }) : super(
          users: users,
          currentPage: currentPage,
          totalPage: totalPage,
          pageSize: pageSize,
          curentKeyword: curentKeyword,
        );
}

class UsersInitialState extends UsersState {
  UsersInitialState()
      : super(
          users: [],
          currentPage: 0,
          totalPage: 0,
          pageSize: 20,
          curentKeyword: "",
        );
}

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersRepository usersRepository = UsersRepository();
  late UsersEvent currentEvent;
  UsersBloc() : super(UsersInitialState()) {
    on((SearchUsersEvent event, emit) async {
      currentEvent = event;
      emit(SearchUsersLoadingState(
        users: state.users,
        curentKeyword: state.curentKeyword,
        currentPage: state.currentPage,
        pageSize: state.pageSize,
        totalPage: state.totalPage,
      ));
      try {
        ListUsers listUsers = await usersRepository.searchUsers(
            event.keyword, event.page, event.pageSize);
        int totalPages = (listUsers.totalCount / event.pageSize).floor();
        if (listUsers.totalCount % event.pageSize != 0) {
          totalPages = totalPages + 1;
        }

        emit(SearchUsersSuccessState(
          users: listUsers.items,
          currentPage: event.page,
          totalPage: totalPages,
          pageSize: event.pageSize,
          curentKeyword: event.keyword,
        ));
      } catch (e) {
        emit(SearchUsersErrorState(
          users: state.users,
          curentKeyword: state.curentKeyword,
          currentPage: state.currentPage,
          pageSize: state.pageSize,
          totalPage: state.totalPage,
          errorMessage: e.toString(),
        ));
      }
    });
    on((NextPageEvent event, emit) async {
      currentEvent = event;
      print("next page : ${event.page}");
      try {
        ListUsers listUsers = await usersRepository.searchUsers(
            event.keyword, event.page, event.pageSize);
        int totalPages = (listUsers.totalCount / event.pageSize).floor();
        if (listUsers.totalCount % event.pageSize != 0) {
          totalPages = totalPages + 1;
        }

        List<User> currentList = [...state.users];
        currentList.addAll(listUsers.items);
        print(currentList.length);
        emit(SearchUsersSuccessState(
          users: currentList,
          currentPage: event.page,
          totalPage: totalPages,
          pageSize: event.pageSize,
          curentKeyword: event.keyword,
        ));
      } catch (e) {
        emit(SearchUsersErrorState(
          users: state.users,
          curentKeyword: state.curentKeyword,
          currentPage: state.currentPage,
          pageSize: state.pageSize,
          totalPage: state.totalPage,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
