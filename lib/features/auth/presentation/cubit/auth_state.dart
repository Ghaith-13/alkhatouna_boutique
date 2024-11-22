// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

class AuthState extends Equatable {
  AuthState(
      {this.email = "",
      this.name = "",
      this.phone = "",
      this.password = "",
      this.loading = false,
      this.loadingOtp = false,
      this.whatsappData,
      this.otpCode = "",
      this.loadingWhatsAppSettings = false,
      this.logInmethod = ""});
  String? email, name, phone, password, logInmethod, otpCode;
  bool loading, loadingOtp, loadingWhatsAppSettings;
  WhatsappData? whatsappData;
  @override
  List<Object?> get props => [
        email,
        name,
        otpCode,
        loadingOtp,
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
          String? otpCode,
          String? phone,
          String? password,
          bool? loading,
          bool? loadingOtp,
          bool? loadingWhatsAppSettings,
          WhatsappData? whatsappData}) =>
      AuthState(
          email: email ?? this.email,
          otpCode: otpCode ?? this.otpCode,
          loadingOtp: loadingOtp ?? this.loadingOtp,
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
