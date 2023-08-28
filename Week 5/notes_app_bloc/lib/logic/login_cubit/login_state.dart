part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable{}

final class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}
final class LoginSuccessful extends LoginState {
  final UserCredential credential;
  LoginSuccessful(this.credential);
  @override
  List<Object?> get props => [true, credential];
}

final class LoginLoading extends LoginState {
  @override
  List<Object?> get props => ["loading"];
}

final class LoginFailed extends LoginState {
  @override
  List<Object?> get props => [false];
}
