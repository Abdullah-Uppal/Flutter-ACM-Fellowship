part of 'auth_cubit.dart';

@immutable
sealed class AuthState extends Equatable {}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthLoggedIn extends AuthState {
  Profile? profile;
  AuthLoggedIn({this.profile});

  @override
  List<Object?> get props => [profile];
}
