part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => null;
}