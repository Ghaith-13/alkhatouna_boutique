// ignore_for_file: must_be_immutable

part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  ProfileState(
      {this.laodingOrders = false,
      this.laodingGetSettings = false,
      this.myOrders,
      this.articles,
      this.myPointsData,
      this.repeateNewPassword = "",
      this.newPassword = "",
      this.tutorial,
      this.faqData,
      this.settings,
      this.walletData,
      this.allOrders,
      this.feedback = "",
      this.orderId = "",
      this.loaidngProfile = false,
      this.getUserInfo = false,
      this.laodingFaq = false,
      this.loadingPoints = false,
      this.loadingArticles = false,
      this.laodingfeedback = false,
      this.userInfo});
  bool laodingOrders,
      laodingGetSettings,
      loadingPoints,
      getUserInfo,
      loaidngProfile,
      laodingfeedback,
      laodingFaq,
      loadingArticles;
  MyPointsData? myPointsData;
  OrdersList? myOrders;
  FaqData? faqData;
  SettingsDataModel? settings;
  UserInfo? userInfo;
  WalletData? walletData;
  String? feedback, orderId, repeateNewPassword, newPassword;
  List<Articles>? articles;
  List<Tutorial>? tutorial = [];
  List<Pending>? allOrders;

  @override
  List<Object?> get props => [
        laodingOrders,
        laodingGetSettings,
        myOrders,
        faqData,
        articles,
        allOrders,
        loadingPoints,
        myPointsData,
        getUserInfo,
        repeateNewPassword,
        laodingFaq,
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
          loadingPoints,
          getUserInfo,
          laodingFaq,
          List<Pending>? allOrders,
          loaidngProfile,
          MyPointsData? myPointsData,
          FaqData? faqData,
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
        allOrders: allOrders ?? this.allOrders,
        faqData: faqData ?? this.faqData,
        laodingGetSettings: laodingGetSettings ?? this.laodingGetSettings,
        myPointsData: myPointsData ?? this.myPointsData,
        loadingPoints: loadingPoints ?? this.loadingPoints,
        laodingFaq: laodingFaq ?? this.laodingFaq,
        articles: articles ?? this.articles,
        walletData: walletData ?? this.walletData,
        orderId: orderId ?? this.orderId,
        getUserInfo: getUserInfo ?? this.getUserInfo,
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
