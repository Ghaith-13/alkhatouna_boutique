import 'dart:math';

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/core/utils/http_helper.dart';
import 'package:alkhatouna/features/auth/data/models/check_number_model.dart';
import 'package:alkhatouna/features/auth/data/models/google_model.dart';
import 'package:alkhatouna/features/auth/data/models/reset_password_model.dart';
import 'package:alkhatouna/features/auth/data/models/send_otp_model.dart';
import 'package:alkhatouna/features/auth/data/models/sign_up_model.dart';
import 'package:alkhatouna/features/auth/data/models/whatsapp_settings_model.dart';
import 'package:alkhatouna/features/auth/data/repositories/sign_up_repo.dart';
import 'package:alkhatouna/features/auth/presentation/pages/reset_password.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/main.dart';
import 'package:alkhatouna/main_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../injection_container.dart' as di;
import 'package:http/http.dart' as http;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpRepo signUpRepo;

  AuthCubit({
    required this.signUpRepo,
  }) : super(AuthInitial());
  changeNameValue(String name) => emit(state.copyWith(name: name));
  changeBirthdateValue(String birthdate) =>
      emit(state.copyWith(birthdate: birthdate));
  changePhoneValue(String phone) => emit(state.copyWith(phone: phone));
  changeEmailValue(String email) => emit(state.copyWith(email: email));
  changeLogInMethodValue(String logInmethod) =>
      emit(state.copyWith(logInmethod: logInmethod));
  changePasswordValue(String password) =>
      emit(state.copyWith(password: password));
  changeOtpCode(String otpCode) => emit(state.copyWith(otpCode: otpCode));

  Future<void> SignUp() async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['phone'] = state.phone!;
      body['email'] = state.email!;
      body['password'] = state.password!;
      body['fcm_token'] = token ?? "";
      body['name'] = state.name!;
      if (state.birthdate!.isNotEmpty) {
        body['birthdate'] = state.birthdate!;
      }
      SignUpModel? response = await signUpRepo.signUp(body: body);

      await cacheData(response);
      di.sl<ApiBaseHelper>().updateHeader();

      emit(state.copyWith(
          phone: "", password: "", email: "", logInmethod: "", name: ""));
      Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => const mainScreen(
                  refresheveyThing: true,
                )),
        (Route route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken"
                    .tr(navigatorKey.currentContext!)
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken"
                        .tr(navigatorKey.currentContext!)
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> authUsingGoogle(String name, String email) async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['name'] = name;
      body['email'] = email;
      body['fcm_token'] = token ?? "";
      GoogleModel? response = await signUpRepo.authUsingGoogle(body: body);
      if (response.data!.user!.isActive == "0") {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Your acount in not activated".tr(navigatorKey.currentContext!),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        await cacheDataUsingGoogle(response);
        di.sl<ApiBaseHelper>().updateHeader();

        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const mainScreen(
                    refresheveyThing: true,
                  )),
          (Route route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken"
                    .tr(navigatorKey.currentContext!)
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken"
                        .tr(navigatorKey.currentContext!)
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> logIn() async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['login'] = state.logInmethod!;
      body['password'] = state.password!;
      body['fcm_token'] = token ?? "";
      SignUpModel? response = await signUpRepo.logIn(body: body);
      if (response.data!.user!.isActive == "0") {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Your acount in not activated".tr(navigatorKey.currentContext!),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        await cacheData(response);
        di.sl<ApiBaseHelper>().updateHeader();

        emit(state.copyWith(
            phone: "", password: "", email: "", logInmethod: "", name: ""));
        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const mainScreen(
                    refresheveyThing: true,
                  )),
          (Route route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr(navigatorKey.currentContext!)
                : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> sendOtp() async {
    emit(state.copyWith(loadingOtp: true));
    try {
      Map<String, String> body = {};
      body['email'] = state.email ?? "";

      SendOtpModel? response = await signUpRepo.sendOtp(body: body);
      emit(state.copyWith(otpCode: response.otp.toString()));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr(navigatorKey.currentContext!)
                : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingOtp: false));
  }

  Future<void> resetPassword(String phone, String password,
      {bool fromProfile = false}) async {
    emit(state.copyWith(loading: true));
    try {
      Map<String, String> body = {};
      body['login'] = phone;
      body['password'] = password;
      ResetPasswordModel? response = await signUpRepo.resetPassword(body: body);
      if (fromProfile) {
        Navigator.pop(navigatorKey.currentContext!);
        navigatorKey.currentContext!
            .read<ProfileCubit>()
            .getuserInfo(navigatorKey.currentContext!);
      }
      if (response.data!.message!.contains("Password updated successfully")) {
        Navigator.pop(navigatorKey.currentContext!);
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Password updated successfully".tr(navigatorKey.currentContext!),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Password not updated".tr(navigatorKey.currentContext!),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr(navigatorKey.currentContext!)
                : e.toString().contains('The login field is required')
                    ? "Invalid login credentials"
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> getWhatssappSettings() async {
    emit(state.copyWith(loadingWhatsAppSettings: true));
    try {
      WhatsappSettingsModel? response = await signUpRepo.getWhatsappSettings();
      emit(state.copyWith(whatsappData: response.data));
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr(navigatorKey.currentContext!)
                : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingWhatsAppSettings: false));
  }

  changeverficationPhoneNumber(value) =>
      emit(state.copyWith(verficationPhoneNumber: value));
  Future sendVerficationPhoneAddress(BuildContext context, String phone) async {
    try {
      WhatsappSettingsModel? response = await signUpRepo.getWhatsappSettings();
      int? number;
      final random = Random();
      number = 1000 + random.nextInt(9000);
      String phoneNumber = phone;
      // print(phoneNumber);
      // print(number);
      if (phoneNumber.startsWith("07")) {
        phoneNumber = phoneNumber.replaceFirst("0", "+964");
      }
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      // print(phoneNumber);
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.ultramsg.com/${response.data!.instanceId}/messages/chat'));
      request.bodyFields = {
        'token': '${response.data!.token}',
        'to': '$phoneNumber',
        'body':
            'Your code to activate account in ALKHATOUNA BOUTIQUE is  $number'
      };
      request.headers.addAll(headers);

      http.StreamedResponse response2 = await request.send();
      emit(state.copyWith(verficationPhoneNumber: number.toString()));
      if (response2.statusCode == 200) {
        // print(await response2.stream
        //     .bytesToString());

        // context.read<AuthCubit>().SignUp(context);
      } else {
        if (response2.reasonPhrase == "Not Found") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              padding: EdgeInsets.only(
                  bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
              content: Text(
                response2.reasonPhrase!,
                style: const TextStyle(color: Colors.white),
              ),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr(navigatorKey.currentContext!)
                : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> cacheData(SignUpModel response) async {
    if (response.data!.token != null) {
      await CacheHelper.saveData(
          key: "USER_TOKEN", value: response.data!.token);
    }
    if (response.data!.user!.email != null) {
      await CacheHelper.saveData(
          key: "EMAIL", value: response.data!.user!.email);
    }
    if (response.data!.user!.phone != null) {
      await CacheHelper.saveData(
          key: "Phone_Number", value: response.data!.user!.phone);
    }
    if (response.data!.user!.birthdate != null) {
      await CacheHelper.saveData(
          key: "Birthdate", value: response.data!.user!.birthdate);
    }
    if (response.data!.user!.id != null) {
      await CacheHelper.saveData(
          key: "USER_ID", value: response.data!.user!.id.toString());
    }
    if (response.data!.user!.name != null) {
      await CacheHelper.saveData(key: "NAME", value: response.data!.user!.name);
    }
  }

  Future<void> cacheDataUsingGoogle(GoogleModel response) async {
    if (response.data!.token != null) {
      await CacheHelper.saveData(
          key: "USER_TOKEN", value: response.data!.token);
    }
    if (response.data!.user!.id != null) {
      await CacheHelper.saveData(
          key: "USER_ID", value: response.data!.user!.id.toString());
    }
    if (response.data!.user!.email != null) {
      await CacheHelper.saveData(
          key: "EMAIL", value: response.data!.user!.email);
    }
    if (response.data!.user!.name != null) {
      await CacheHelper.saveData(key: "NAME", value: response.data!.user!.name);
    }
  }

  Future<bool> checkNumber(
    String number,
  ) async {
    emit(state.copyWith(loading: true));
    emit(state.copyWith(loadingOtp: true));

    try {
      CheckNumberModel? response = await signUpRepo.checkNumber(number: number);

      if (response.data!.message!
          .contains("The phone is registered with name")) {
        // Navigator.pushReplacement(
        //   navigatorKey.currentContext!,
        //   MaterialPageRoute<void>(
        //     builder: (context) => ResetPassword(
        //       phoeNumber: number,
        //     ),
        //   ),
        // );
        emit(state.copyWith(loadingOtp: false));
        emit(state.copyWith(loading: false));
        return true;
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "There is no account for this number."
                  .tr(navigatorKey.currentContext!),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        emit(state.copyWith(loadingOtp: false));
        emit(state.copyWith(loading: false));
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken"
                    .tr(navigatorKey.currentContext!)
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken"
                        .tr(navigatorKey.currentContext!)
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingOtp: false));
    emit(state.copyWith(loading: false));
    return false;
  }
}
