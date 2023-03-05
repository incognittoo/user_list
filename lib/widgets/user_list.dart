import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/bloc/user_bloc.dart';
import 'package:user_list/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      //Если данные конктактов не загружены
      if (state is UserEmplyState) {
        return Center(
            child: Text(
          'Нажмите на кнопку загрузить, чтобы отобразить список контактов',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
          textAlign: TextAlign.center,
        ));
      }
      //Включаем индикатор загрузки после нажатия кнопки "загрузить"
      if (state is UserLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      //Если данные конктактов загружены, отображаем список
      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[70],
            child: ListTile(
              leading: Text('${state.loadedUser[index].id}'),
              title: Column(children: [
                Text(
                  '${state.loadedUser[index].name}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${state.loadedUser[index].email}'),
                    Text('${state.loadedUser[index].phone}')
                  ],
                )
              ]),
            ),
          ),
        );
      }
      //Если появилась данные конктактов
      if (state is UserErrorState) {
        return Center(
            child: Text(
          'Ошибка при загрузки контактов',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
          textAlign: TextAlign.center,
        ));
      }
      return SizedBox.shrink();
    });
  }
}
