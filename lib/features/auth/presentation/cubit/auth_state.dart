// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

class AuthState extends Equatable {
  AuthState(
      {this.email = "",
      this.name = "",
      this.phone = "",
      this.password = "",
      this.loading = false,
      this.whatsappData,
      this.loadingWhatsAppSettings = false,
      this.logInmethod = ""});
  String? email, name, phone, password, logInmethod;
  bool loading, loadingWhatsAppSettings;
  WhatsappData? whatsappData;
  @override
  List<Object?> get props => [
        email,
        name,
        phone,
        password,
        whatsappData,
        loading,
        logInmethod,
        loadingWhatsAppSettings
      ];
  AuthState copyWith(
          {String? email,
          String? name,
          String? logInmethod,
          String? phone,
          String? password,
          bool? loading,
          bool? loadingWhatsAppSettings,
          WhatsappData? whatsappData}) =>
      AuthState(
          email: email ?? this.email,
          whatsappData: whatsappData ?? this.whatsappData,
          loadingWhatsAppSettings:
              loadingWhatsAppSettings ?? this.loadingWhatsAppSettings,
          logInmethod: logInmethod ?? this.logInmethod,
          loading: loading ?? this.loading,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          password: password ?? this.password);
}

class AuthInitial extends AuthState {}
