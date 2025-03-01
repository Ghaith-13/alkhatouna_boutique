import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/cache_helper.dart';
import 'package:alkhatouna/core/utils/http_helper.dart';
import 'package:alkhatouna/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:alkhatouna/features/home/presentation/pages/home.dart';
import 'package:alkhatouna/features/profile/data/models/aricales_model.dart';
import 'package:alkhatouna/features/profile/data/models/birthdate_model.dart';
import 'package:alkhatouna/features/profile/data/models/cancel_order_model.dart';
import 'package:alkhatouna/features/profile/data/models/delete_account_model.dart';
import 'package:alkhatouna/features/profile/data/models/faq_model.dart';
import 'package:alkhatouna/features/profile/data/models/feedback_model.dart';
import 'package:alkhatouna/features/profile/data/models/my_points.dart';
import 'package:alkhatouna/features/profile/data/models/orders_model.dart';
import 'package:alkhatouna/features/profile/data/models/settings_model.dart';
import 'package:alkhatouna/features/profile/data/models/tutorilas_model.dart';
import 'package:alkhatouna/features/profile/data/models/wallet_model.dart';
import 'package:alkhatouna/features/profile/data/repositories/profile_repo.dart';
import 'package:alkhatouna/features/profile/presentation/pages/add_newnumber_screen.dart';
import 'package:alkhatouna/fixing_screen.dart';
import 'package:alkhatouna/main.dart';
import 'package:alkhatouna/main_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_info_model.dart';
import '../../../../injection_container.dart' as di;

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({
    required this.profileRepo,
  }) : super(ProfileInitial());
  changefeedback(String value) => emit(state.copyWith(feedback: value));
  changeorderId(String value) => emit(state.copyWith(orderId: value));
  changebirthdate(String birthdate) =>
      emit(state.copyWith(birthdate: birthdate));

  Future<void> getOrders(BuildContext context) async {
    emit(state.copyWith(laodingOrders: true));
    try {
      MyOrdersModel response = await profileRepo.getOrders();

      emit(state.copyWith(myOrders: response.data));
      List<Pending>? order = [];
      order.addAll(response.data!.pending ?? []);
      order.addAll(response.data!.cancelled ?? []);
      order.addAll(response.data!.completed ?? []);
      order.addAll(response.data!.confirmed ?? []);
      order.addAll(response.data!.delivered ?? []);
      order.addAll(response.data!.onTheWay ?? []);
      order.addAll(response.data!.returned ?? []);
      order.addAll(response.data!.readyToShip ?? []);
      order.sort((a, b) {
        DateTime dateA = DateTime.parse(a.createdAt);
        DateTime dateB = DateTime.parse(b.createdAt);
        return dateB.compareTo(dateA);
      });
      emit(state.copyWith(allOrders: order));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingOrders: false));
  }

  Future<void> getMyPoints(BuildContext context) async {
    emit(state.copyWith(loadingPoints: true));
    try {
      MyPointsModel response = await profileRepo.getPoints();
      emit(state.copyWith(myPointsData: response.data));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingPoints: false));
  }

  Future<void> getFaq(BuildContext context) async {
    emit(state.copyWith(laodingFaq: true));
    try {
      faqModel response = await profileRepo.getFaq();
      emit(state.copyWith(faqData: response.data));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingFaq: false));
  }

  Future<void> refreshProfileScreen() async {
    emit(state.copyWith(getUserInfo: false));
  }

  Future<void> getuserInfo(BuildContext context) async {
    if (state.getUserInfo) {
    } else {
      emit(state.copyWith(loaidngProfile: true));
      try {
        UserModel response = await profileRepo.getuserInfo();
        emit(state.copyWith(userInfo: response.data, getUserInfo: true));
        if (response.data?.phone == null) {
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const AddNewnumberScreen(fromHomePage: true),
            ),
          );
        } else if (response.data?.phone.isEmpty) {
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const AddNewnumberScreen(fromHomePage: true),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              e.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
      emit(state.copyWith(loaidngProfile: false));
    }
  }

  Future<void> cancelOrder(BuildContext context, String orderid) async {
    emit(state.copyWith(laodingCancelOrder: true));
    try {
      CancelOrderModel response = await profileRepo.cancelOrder(orderid);
      if (response.message == "Order cancelled successfully") {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Cancelled successfully".tr(navigatorKey.currentContext!),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        getOrders(navigatorKey.currentContext!);
        Navigator.pop(navigatorKey.currentContext!);
        Navigator.pop(navigatorKey.currentContext!);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      emit(state.copyWith(laodingCancelOrder: false));
    }
    emit(state.copyWith(laodingCancelOrder: false));
  }

  changerepeateNewPassword(String value) =>
      emit(state.copyWith(repeateNewPassword: value));
  changeNewPassword(String value) => emit(state.copyWith(newPassword: value));
  Future<void> sendFeedback(
    BuildContext context,
  ) async {
    try {
      emit(state.copyWith(laodingfeedback: true));
      Map<String, String> body = {};
      body['order_id'] = "${state.orderId}";
      body['message'] = "${state.feedback}";

      FeedbackModel? response = await profileRepo.sendFeedBack(body: body);
      if (response.data!.message == "Feedback added successfully") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Thank you for sharing your review.".tr(context),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingfeedback: false));
  }

  Future<void> deleteAccount(
    BuildContext context,
  ) async {
    try {
      emit(state.copyWith(laodingfeedback: true));
      Map<String, String> body = {};

      DeleteAccountModel? response =
          await profileRepo.deleteAccount(body: body);
      if (response.data!.message == "Account deleted successfully") {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        di.sl<ApiBaseHelper>().updateHeader();

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
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
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingfeedback: false));
  }

  Future<void> getArticles(BuildContext context) async {
    emit(state.copyWith(loadingArticles: true));
    try {
      ArticlesModel response = await profileRepo.getArticles();
      emit(state.copyWith(articles: response.data));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingArticles: false));
  }

  Future<void> updateBirthday(BuildContext context, String birthdate) async {
    // emit(state.copyWith(loadingArticles: true));
    try {
      BirthdateModel response = await profileRepo.updatebirthdate(birthdate);
      if (response.data!.message == "Birthdate updated successfully") {
        emit(state.copyWith(birthdate: birthdate));
        await CacheHelper.saveData(key: "Birthdate", value: birthdate);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Birthday entered successfully".tr(context),
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
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    // emit(state.copyWith(loadingArticles: false));
  }

  Future<void> updateUpdatePhone(BuildContext context, String phone,
      {bool fromHomePage = false}) async {
    // emit(state.copyWith(loadingArticles: true));
    try {
      BirthdateModel response = await profileRepo.updateUpdatePhone(phone);
      if (response.data!.message == "phone updated successfully") {
        // emit(state.copyWith(updatePhone: !state.updatePhone));
        if (fromHomePage) {
          Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const mainScreen(
                      refresheveyThing: true,
                    )),
            (Route route) => false,
          );
        } else {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        }

        refreshProfileScreen();
        getuserInfo(context);
        await CacheHelper.saveData(key: "Phone_Number", value: phone);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Number updated successfully".tr(context),
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      } else if (response.data!.message == "Phone number already exists") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.only(
                bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
            content: Text(
              "Phone number already exists".tr(context),
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
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    // emit(state.copyWith(loadingArticles: false));
  }

  Future<void> gettutorials(BuildContext context) async {
    emit(state.copyWith(loadingArticles: true));
    try {
      TutorialsModel response = await profileRepo.gettutorials();
      emit(state.copyWith(tutorial: response.data));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingArticles: false));
  }

  Future<void> getWallet(BuildContext context) async {
    emit(state.copyWith(loadingArticles: true));
    try {
      WalletModel response = await profileRepo.getWallet();
      emit(state.copyWith(walletData: response.data));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingArticles: false));
  }

  Future<void> getSettings(BuildContext context) async {
    emit(state.copyWith(laodingGetSettings: true));
    try {
      SettingsModel response = await profileRepo.getSettings();
      emit(state.copyWith(settings: response.data));
      if (response.data!.settings!.close_app == 1) {
        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const FixingScreen()),
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
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(laodingGetSettings: false));
  }
}
