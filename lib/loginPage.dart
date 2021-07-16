import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/UserRepository.dart';
import 'package:loginwithbloc/login_bloc/bloc/login_bloc.dart';

import 'bloc/authentication_bloc.dart';
import 'loginForm.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userReposity;

  const LoginPage({Key key, @required this.userReposity})
      : assert(userReposity != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            userReposity: userReposity,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            );
        },
        child: LoginForm(),
      ),
    );
  }
}
