// ignore_for_file: deprecated_member_use, file_names, avoid_print

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/features/profile/presentation/pages/contact_us_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileCubit>().getSettings(context);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> openWhatsApp(String whatsappNumber) async {
      String url = Uri.encodeFull('https://wa.me/$whatsappNumber');
      // Check if WhatsApp is installed
      await canLaunch(url) ? launch(url) : print('WhatsApp not installed');
    }

    Future<void> callNumber(String phoneNumber) async {
      const String url = 'tel:';
      if (await canLaunch(url + phoneNumber)) {
        await launch(url + phoneNumber);
      } else {
        print('Failed to launch ');
      }
    }

    Future<void> launchSocialMedia(String insta_link) async {
      if (await canLaunch(insta_link)) {
        await launch(
          insta_link,
          universalLinksOnly: true,
        );
      } else {
        throw 'There was a problem to open the url: $insta_link';
      }
    }

    Future<void> launchEmail(String emailAddress) async {
      const String url = 'mailto:';
      if (await canLaunch(url + emailAddress)) {
        await launch(url + emailAddress);
      } else {
        print('Failed to launch email for address $emailAddress');
      }
    }

    Future<void> launchMessage(String emailAddress) async {
      const String url = 'sms:';
      if (await canLaunch(url + emailAddress)) {
        await launch(url + emailAddress);
      } else {
        print('Failed to launch email for address $emailAddress');
      }
    }

    return Scaffold(
      appBar: AppConstant.customAppBar(
        context,
        "contact_us".tr(context),
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.laodingGetSettings
              ? ContactUsSkeleton()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/contact_us.jpg",
                            height: 250.h,
                          ),
                        ),
                        20.verticalSpace,
                        state.settings!.settings!.facebookLink == null &&
                                state.settings!.settings!.whatsappLink ==
                                    null &&
                                state.settings!.settings!.tiktokLink == null &&
                                state.settings!.settings!.instagramLink == null
                            ? SizedBox()
                            : Text(
                                "Social media".tr(context),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            state.settings!.settings!.whatsappLink == null
                                ? SizedBox()
                                : InkWell(
                                    onTap: () async {
                                      await openWhatsApp(
                                          "${state.settings!.settings!.whatsappLink}");
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/WhatsApp_icon.png",
                                          height: 45.h,
                                        ),
                                        Text(
                                            "${state.settings!.settings!.whatsappName}")
                                      ],
                                    )),
                            5.horizontalSpace,
                            state.settings!.settings!.instagramLink == null
                                ? SizedBox()
                                : InkWell(
                                    onTap: () async {
                                      await launchSocialMedia(
                                          "${state.settings!.settings!.instagramLink}");
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/insta_icon.png",
                                          height: 45.h,
                                        ),
                                        Text(
                                            "${state.settings!.settings!.instagramName}")
                                      ],
                                    )),
                            5.horizontalSpace,
                            state.settings!.settings!.tiktokLink == null
                                ? SizedBox()
                                : InkWell(
                                    onTap: () async {
                                      await launchSocialMedia(
                                          "${state.settings!.settings!.tiktokLink}");
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/tikto_icon.png",
                                          height: 45.h,
                                        ),
                                        Text(
                                            "${state.settings!.settings!.tiktokName}")
                                      ],
                                    )),
                            5.horizontalSpace,
                            state.settings!.settings!.facebookLink == null
                                ? SizedBox()
                                : InkWell(
                                    onTap: () async {
                                      await launchSocialMedia(
                                          "${state.settings!.settings!.facebookLink}");
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/facebook_icon.png",
                                          height: 45.h,
                                        ),
                                        Text(
                                            "${state.settings!.settings!.facebookName}")
                                      ],
                                    ))
                          ],
                        ),
                        20.verticalSpace,
                        const Divider(),
                        20.verticalSpace,
                        state.settings!.settings!.phoneSupport == null
                            ? SizedBox()
                            : Text(
                                "Contact Us".tr(context),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                        20.verticalSpace,
                        state.settings!.settings!.phoneSupport == null
                            ? SizedBox()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        await callNumber(
                                            "${state.settings!.settings!.phoneSupport}");
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: AppColors.primaryColor,
                                        child: Icon(Icons.call,
                                            color: AppColors.whiteColor),
                                      )),
                                  20.horizontalSpace,
                                  InkWell(
                                      onTap: () async {
                                        await launchMessage(
                                            "${state.settings!.settings!.phoneSupport}");
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: AppColors.primaryColor,
                                        child: Icon(Icons.mail,
                                            color: AppColors.whiteColor),
                                      )),
                                ],
                              ),
                        20.verticalSpace,
                        const Divider(),
                        20.verticalSpace,
                        Text(
                          "email".tr(context),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        20.verticalSpace,
                        state.settings!.settings!.emailSupport == null
                            ? SizedBox()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        await launchEmail(
                                            "${state.settings!.settings!.emailSupport}");
                                      },
                                      child: Text(
                                        "${state.settings!.settings!.emailSupport!}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              )
                      ]),
                );
        },
      ),
    );
  }
}
