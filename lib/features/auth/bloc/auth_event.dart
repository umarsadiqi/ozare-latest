part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class AuthLoginRequested extends AuthEvent {
  const AuthLoginRequested({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

class AuthSignupPageRequested extends AuthEvent {
  const AuthSignupPageRequested();
}

class AuthSignupRequested extends AuthEvent {
  const AuthSignupRequested({
    required this.ouser,
    required this.password,
  });

  final OUser ouser;
  final String password;

  @override
  List<Object> get props => [ouser, password];
}

class AuthOnboardingCompleted extends AuthEvent {
  const AuthOnboardingCompleted();
}

class AuthLoginPageRequested extends AuthEvent {
  const AuthLoginPageRequested();
}

class AuthGoogleLoginRequested extends AuthEvent {
  const AuthGoogleLoginRequested();
}
