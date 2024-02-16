import 'package:cadastro_tarefas_provider_crud/models/user.dart';
import 'package:cadastro_tarefas_provider_crud/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  UserForm({super.key});

  void _loadFormData(User user) {
    _formData['id'] = user.id!;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    try {
      final user = ModalRoute.of(context)!.settings.arguments as User;
      _loadFormData(user);
    } catch (e) {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuarios'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();
                Provider.of<UsersProvider>(context, listen: false).put(User(
                    id: _formData['id'],
                    name: _formData['name']!,
                    email: _formData['email']!,
                    avatarUrl: _formData['avatarUrl']!));
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value!.trim().length < 3) {
                      return 'Nome muito perqueno. No minimo 3 letrar';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value!,

                  //onSaved: (value) => _formData['name'] = value,
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                  onSaved: (value) => _formData['email'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: InputDecoration(
                    labelText: 'URL do Avatar',
                  ),
                  onSaved: (value) => _formData['avatarUrl'] = value!,
                ),
              ],
            ),
          )),
    );
  }
}
