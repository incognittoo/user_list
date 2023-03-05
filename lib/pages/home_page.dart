import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/bloc/user_bloc.dart';

import '../services/user_repository.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersRepository = UsersRepository();

    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Пользователи'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ActionButtons(), Expanded(child: UserList())],
        ),
      ),
    );
  }
}
