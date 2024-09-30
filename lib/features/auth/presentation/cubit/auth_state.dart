// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

class AuthState extends Equatable {
  AuthState(
      {this.email = "",
      this.name = "",
      this.phone = "",
      this.password = "",
      this.loading = false,
      this.logInmethod = ""});
  String? email, name, phone, password, logInmethod;
  bool loading;
  @override
  List<Object?> get props =>
      [email, name, phone, password, loading, logInmethod];
  AuthState copyWith(
          {String? email,
          String? name,
          String? logInmethod,
          String? phone,
          String? password,
          bool? loading}) =>
      AuthState(
          email: email ?? this.email,
          logInmethod: logInmethod ?? this.logInmethod,
          loading: loading ?? this.loading,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          password: password ?? this.password);
}

class AuthInitial extends AuthState {}
