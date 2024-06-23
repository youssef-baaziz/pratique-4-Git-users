import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_4/bloc/users.bloc.dart';
import 'package:flutter_app_4/ui/themes/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
          if (state is SearchUsersSuccessState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Git Users",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "${state.currentPage} / ${state.totalPage}",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 1,
                )
              ],
            );
          } else {
            return const Text(
              "Git Users",
              style: TextStyle(color: Colors.white),
            );
          }
        }),
        // title: const Text("Git users"),
        // backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 2)),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    String kw = textEditingController.text;
                    context.read<UsersBloc>().add(
                        SearchUsersEvent(keyword: kw, page: 0, pageSize: 20));
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
          ),
          BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is SearchUsersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SearchUsersErrorState) {
                return Column(
                  children: [
                    Text(
                      state.errorMessage,
                      style: MyAppTheme.errorTextStyle,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          UsersBloc usersBloc = context.read<UsersBloc>();
                          usersBloc.add(usersBloc.currentEvent);
                        },
                        child: const Text("Retry"))
                  ],
                );
              } else if (state is SearchUsersSuccessState) {
                return Expanded(
                  child: LazyLoadScrollView(
                    onEndOfPage: () {
                      context.read<UsersBloc>().add(NextPageEvent(
                            keyword: state.curentKeyword,
                            page: state.currentPage + 1,
                            pageSize: state.pageSize,
                          ));
                    },
                    child: ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            state.users[index].avatarUrl),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        state.users[index].login,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                    child: Text("${state.users[index].score}"),
                                  )
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 4,
                          );
                        },
                        itemCount: state.users.length),
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
