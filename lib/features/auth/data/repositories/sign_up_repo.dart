// ignore_for_file: file_names

import 'package:alkhatouna/features/auth/data/datasources/sign_up_ds.dart';
import 'package:alkhatouna/features/auth/data/models/check_number_model.dart';
import 'package:alkhatouna/features/auth/data/models/google_model.dart';
import 'package:alkhatouna/features/auth/data/models/reset_password_model.dart';
import 'package:alkhatouna/features/auth/data/models/send_otp_model.dart';
import 'package:alkhatouna/features/auth/data/models/sign_up_model.dart';
import 'package:alkhatouna/features/auth/data/models/whatsapp_settings_model.dart';

class SignUpRepo {
  final SignUpDs dataSource;

  SignUpRepo({required this.dataSource});

  Future<SignUpModel> signUp({required Map<String, String> body}) async {
    SignUpModel response = SignUpModel.fromJson(
      await dataSource.signUp(body),
    );
    return response;
  }

  Future<SignUpModel> logIn({required Map<String, String> body}) async {
    SignUpModel response = SignUpModel.fromJson(
      await dataSource.logIn(body),
    );
    return response;
  }

  Future<GoogleModel> authUsingGoogle(
      {required Map<String, String> body}) async {
    GoogleModel response = GoogleModel.fromJson(
      await dataSource.authUsingGoogle(body),
    );
    return response;
  }

  Future<ResetPasswordModel> resetPassword(
      {required Map<String, String> body}) async {
    ResetPasswordModel response = ResetPasswordModel.fromJson(
      await dataSource.resetPassword(body),
    );
    return response;
  }

  Future<SendOtpModel> sendOtp({required Map<String, String> body}) async {
    SendOtpModel response = SendOtpModel.fromJson(
      await dataSource.sendOtp(body),
    );
    return response;
  }

  Future<CheckNumberModel> checkNumber({required String number}) async {
    CheckNumberModel response = CheckNumberModel.fromJson(
      await dataSource.checkNumber(number),
    );
    return response;
  }

  Future<WhatsappSettingsModel> getWhatsappSettings() async {
    WhatsappSettingsModel response = WhatsappSettingsModel.fromJson(
      await dataSource.getWhatsappSettings(),
    );
    return response;
  }
}
