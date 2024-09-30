// ignore_for_file: must_be_immutable

part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  ProfileState(
      {this.laodingOrders = false,
      this.laodingGetSettings = false,
      this.myOrders,
      this.articles,
      this.repeateNewPassword = "",
      this.newPassword = "",
      this.tutorial,
      this.settings,
      this.walletData,
      this.feedback = "",
      this.orderId = "",
      this.loaidngProfile = false,
      this.loadingArticles = false,
      this.laodingfeedback = false,
      this.userInfo});
  bool laodingOrders,
      laodingGetSettings,
      loaidngProfile,
      laodingfeedback,
      loadingArticles;
  OrdersList? myOrders;
  SettingsDataModel? settings;
  UserInfo? userInfo;
  WalletData? walletData;
  String? feedback, orderId, repeateNewPassword, newPassword;
  List<Articles>? articles;
  List<Tutorial>? tutorial;

  @override
  List<Object?> get props => [
        laodingOrders,
        laodingGetSettings,
        myOrders,
        articles,
        repeateNewPassword,
        newPassword,
        orderId,
        settings,
        tutorial,
        loadingArticles,
        loaidngProfile,
        walletData,
        userInfo,
        feedback,
        laodingfeedback,
      ];
  ProfileState copyWith(
          {bool? laodingOrders,
          loadingArticles,
          laodingGetSettings,
          laodingfeedback,
          loaidngProfile,
          String? feedback,
          orderId,
          repeateNewPassword,
          newPassword,
          SettingsDataModel? settings,
          List<Tutorial>? tutorial,
          UserInfo? userInfo,
          OrdersList? myOrders,
          WalletData? walletData,
          List<Articles>? articles}) =>
      ProfileState(
        feedback: feedback ?? this.feedback,
        settings: settings ?? this.settings,
        laodingGetSettings: laodingGetSettings ?? this.laodingGetSettings,
        articles: articles ?? this.articles,
        walletData: walletData ?? this.walletData,
        orderId: orderId ?? this.orderId,
        tutorial: tutorial ?? this.tutorial,
        loadingArticles: loadingArticles ?? this.loadingArticles,
        repeateNewPassword: repeateNewPassword ?? this.repeateNewPassword,
        newPassword: newPassword ?? this.newPassword,
        laodingfeedback: laodingfeedback ?? this.laodingfeedback,
        laodingOrders: laodingOrders ?? this.laodingOrders,
        loaidngProfile: loaidngProfile ?? this.loaidngProfile,
        userInfo: userInfo ?? this.userInfo,
        myOrders: myOrders ?? this.myOrders,
      );
}

class ProfileInitial extends ProfileState {}
