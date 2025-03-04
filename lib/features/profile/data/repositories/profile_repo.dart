// ignore_for_file: file_names, non_constant_identifier_names

import 'package:alkhatouna/features/profile/data/datasources/profile_ds.dart';
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
import 'package:alkhatouna/features/profile/data/models/user_info_model.dart';
import 'package:alkhatouna/features/profile/data/models/wallet_model.dart';

class ProfileRepo {
  final ProfileDs dataSource;

  ProfileRepo({required this.dataSource});

  Future<MyOrdersModel> getOrders() async {
    MyOrdersModel MyOrdersResponse = MyOrdersModel.fromJson(
      await dataSource.getOrders(),
    );
    return MyOrdersResponse;
  }

  Future<MyPointsModel> getPoints() async {
    MyPointsModel MyOrdersResponse = MyPointsModel.fromJson(
      await dataSource.getPoints(),
    );
    return MyOrdersResponse;
  }

  Future<faqModel> getFaq() async {
    faqModel MyOrdersResponse = faqModel.fromJson(
      await dataSource.getFaq(),
    );
    return MyOrdersResponse;
  }

  Future<CancelOrderModel> cancelOrder(String orderid) async {
    CancelOrderModel MyOrdersResponse = CancelOrderModel.fromJson(
      await dataSource.cancelOrder(orderid),
    );
    return MyOrdersResponse;
  }

  Future<BirthdateModel> updatebirthdate(String orderid) async {
    BirthdateModel MyOrdersResponse = BirthdateModel.fromJson(
      await dataSource.updatebirthdate(orderid),
    );
    return MyOrdersResponse;
  }

  Future<BirthdateModel> updateUpdatePhone(String orderid) async {
    BirthdateModel MyOrdersResponse = BirthdateModel.fromJson(
      await dataSource.updateUpdatePhone(orderid),
    );
    return MyOrdersResponse;
  }

  Future<UserModel> getuserInfo() async {
    UserModel MyOrdersResponse = UserModel.fromJson(
      await dataSource.getuserInfo(),
    );
    return MyOrdersResponse;
  }

  Future<FeedbackModel> sendFeedBack(
      {required Map<String, String> body}) async {
    FeedbackModel MyOrdersResponse = FeedbackModel.fromJson(
      await dataSource.sendFeedBack(body),
    );
    return MyOrdersResponse;
  }

  Future<DeleteAccountModel> deleteAccount(
      {required Map<String, String> body}) async {
    DeleteAccountModel MyOrdersResponse = DeleteAccountModel.fromJson(
      await dataSource.deleteAccount(body),
    );
    return MyOrdersResponse;
  }

  Future<ArticlesModel> getArticles() async {
    ArticlesModel MyOrdersResponse = ArticlesModel.fromJson(
      await dataSource.getArticles(),
    );
    return MyOrdersResponse;
  }

  Future<TutorialsModel> gettutorials() async {
    TutorialsModel MyOrdersResponse = TutorialsModel.fromJson(
      await dataSource.gettutorials(),
    );
    return MyOrdersResponse;
  }

  Future<WalletModel> getWallet() async {
    WalletModel MyOrdersResponse = WalletModel.fromJson(
      await dataSource.getWallet(),
    );
    return MyOrdersResponse;
  }

  Future<SettingsModel> getSettings() async {
    SettingsModel MyOrdersResponse = SettingsModel.fromJson(
      await dataSource.getSettings(),
    );
    return MyOrdersResponse;
  }
}
