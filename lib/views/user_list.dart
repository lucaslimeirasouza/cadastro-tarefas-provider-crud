import 'package:cadastro_tarefas_provider_crud/components/user_tile.dart';
import 'package:cadastro_tarefas_provider_crud/provider/users.dart';
import 'package:cadastro_tarefas_provider_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Usuários'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        ));
  }
}
