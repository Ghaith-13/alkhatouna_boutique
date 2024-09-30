import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/core/utils/http_helper.dart';
import 'package:alkhatouna/features/auth/data/models/check_number_model.dart';
import 'package:alkhatouna/features/auth/data/models/google_model.dart';
import 'package:alkhatouna/features/auth/data/models/reset_password_model.dart';
import 'package:alkhatouna/features/auth/data/models/sign_up_model.dart';
import 'package:alkhatouna/features/auth/data/repositories/sign_up_repo.dart';
import 'package:alkhatouna/features/auth/presentation/pages/reset_password.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/main_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../injection_container.dart' as di;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpRepo signUpRepo;

  AuthCubit({
    required this.signUpRepo,
  }) : super(AuthInitial());
  changeNameValue(String name) => emit(state.copyWith(name: name));
  changePhoneValue(String phone) => emit(state.copyWith(phone: phone));
  changeEmailValue(String email) => emit(state.copyWith(email: email));
  changeLogInMethodValue(String logInmethod) =>
      emit(state.copyWith(logInmethod: logInmethod));
  changePasswordValue(String password) =>
      emit(state.copyWith(password: password));

  Future<void> SignUp(BuildContext context) async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['phone'] = state.phone!;
      body['email'] = state.email!;
      body['password'] = state.password!;
      body['fcm_token'] = token ?? "";
      body['name'] = state.name!;
      SignUpModel? response = await signUpRepo.signUp(body: body);

      await cacheData(response);
      di.sl<ApiBaseHelper>().updateHeader();

      emit(state.copyWith(
          phone: "", password: "", email: "", logInmethod: "", name: ""));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const mainScreen()),
        (Route route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken".tr(context)
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken".tr(context)
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> authUsingGoogle(
      BuildContext context, String name, String email) async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['name'] = name;
      body['email'] = email;
      body['fcm_token'] = token ?? "";
      GoogleModel? response = await signUpRepo.authUsingGoogle(body: body);
      if (response.data!.user!.isActive == "0") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Your acount in not activated".tr(context),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        await cacheDataUsingGoogle(response);
        di.sl<ApiBaseHelper>().updateHeader();

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const mainScreen()),
          (Route route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken".tr(context)
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken".tr(context)
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> logIn(BuildContext context) async {
    emit(state.copyWith(loading: true));
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      Map<String, String> body = {};
      body['login'] = state.logInmethod!;
      body['password'] = state.password!;
      body['fcm_token'] = token ?? "";
      SignUpModel? response = await signUpRepo.logIn(body: body);
      if (response.data!.user!.isActive == "0") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Your acount in not activated".tr(context),
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
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const mainScreen()),
          (Route route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr(context)
                : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  Future<void> resetPassword(
      String phone, String password, BuildContext context,
      {bool fromProfile = false}) async {
    emit(state.copyWith(loading: true));
    try {
      Map<String, String> body = {};
      body['phone'] = phone;
      body['password'] = password;
      ResetPasswordModel? response = await signUpRepo.resetPassword(body: body);
      if (fromProfile) {
        Navigator.pop(context);
        context.read<ProfileCubit>().getuserInfo(context);
      }
      if (response.data!.message!.contains("Password updated successfully")) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Password updated successfully".tr(context),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Password not updated".tr(context),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('Invalid login credentials')
                ? "Invalid login credentials".tr(context)
                : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
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
    if (response.data!.user!.name != null) {
      await CacheHelper.saveData(key: "NAME", value: response.data!.user!.name);
    }
  }

  Future<void> cacheDataUsingGoogle(GoogleModel response) async {
    if (response.data!.token != null) {
      await CacheHelper.saveData(
          key: "USER_TOKEN", value: response.data!.token);
    }
    if (response.data!.user!.email != null) {
      await CacheHelper.saveData(
          key: "EMAIL", value: response.data!.user!.email);
    }
    if (response.data!.user!.name != null) {
      await CacheHelper.saveData(key: "NAME", value: response.data!.user!.name);
    }
  }

  Future<void> checkNumber(String number, BuildContext context) async {
    emit(state.copyWith(loading: true));

    try {
      CheckNumberModel? response = await signUpRepo.checkNumber(number: number);

      if (response.data!.message!
          .contains("The phone is registered with name")) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ResetPassword(
              phoeNumber: number,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "There is no account for this number.".tr(context),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString().contains('The phone has already been taken.')
                ? "The phone has already been taken".tr(context)
                : e.toString().contains('The email has already been taken')
                    ? "The email has already been taken".tr(context)
                    : e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }
}
