part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthOnboarding extends AuthState {
  const AuthOnboarding();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  final String message;

  const AuthLoading({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class AuthSignup extends AuthState {
  const AuthSignup();

  @override
  List<Object> get props => [];
}

class AuthLogedIn extends AuthState {
  const AuthLogedIn({
    required this.ouser,
  });

  final OUser ouser;

  @override
  List<Object> get props => [ouser];
}

class AuthFailure extends AuthState {
  const AuthFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
