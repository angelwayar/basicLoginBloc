import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:loginwithbloc/UserRepository.dart';
import 'package:loginwithbloc/bloc/authentication_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userReposity;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userReposity, @required this.authenticationBloc})
      : assert(userReposity != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userReposity.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
