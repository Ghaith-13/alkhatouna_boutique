import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/widgets/settings_widgets/language_widget.dart';
import 'package:alkhatouna/features/profile/presentation/widgets/settings_widgets/password_widget.dart';
import 'package:alkhatouna/features/profile/presentation/widgets/settings_widgets/personal_info.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: AppColors.whiteColor,
        elvation: 0,
        // actions: [
        //   Padding(
        //     padding: EdgeInsetsDirectional.only(end: 15.w),
        //     child: Icon(
        //       Icons.search,
        //       size: 24.sp,
        //       color: AppColors.blackColor,
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(12.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings".tr(context),
                    style: TextStyle(
                        fontSize: 34.sp,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700),
                  ),
                  20.ph,
                  FadeInLeft(child: PersonalInfo()),
                  50.ph,
                  state.userInfo!.phone == null
                      ? SizedBox()
                      : state.userInfo!.phone.isEmpty
                          ? SizedBox()
                          : FadeInRight(child: PasswordWidget()),
                  // 50.ph,
                  // FadeInLeft(child: NotificationWidget()),
                  20.ph,
                  FadeInLeft(child: LanguageWidget())
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
