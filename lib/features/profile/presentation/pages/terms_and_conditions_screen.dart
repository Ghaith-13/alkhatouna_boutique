import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<TermsAndConditionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getSettings(context);
  }

  bool isEnglish(String text) {
    RegExp englishRegex = RegExp(r'^[a-zA-Z\s]+$');
    return englishRegex.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(
        context,
        "Terms and conditions".tr(context),
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.laodingGetSettings
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(12.0.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.settings!.settings!.termsAndConditions == null
                            ? SizedBox()
                            : Text(
                                "${"Terms and conditions".tr(context)} :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                        5.verticalSpace,
                        Text(
                          "${state.settings!.settings!.termsAndConditions}",
                          style: TextStyle(height: 2),
                          textAlign: isEnglish(
                                  state.settings!.settings!.termsAndConditions!)
                              ? TextAlign.left
                              : TextAlign.right,
                        ),
                        Divider(),
                        state.settings!.settings!.privacyPolicy == null
                            ? SizedBox()
                            : Text(
                                "${"privacy_policy".tr(context)} :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                        5.verticalSpace,
                        Text(
                          "${state.settings!.settings!.privacyPolicy}",
                          style: TextStyle(height: 2),
                          textAlign: isEnglish(
                                  state.settings!.settings!.privacyPolicy!)
                              ? TextAlign.left
                              : TextAlign.right,
                        ),
                        Divider(),
                        state.settings!.settings!.refundPolicy == null
                            ? SizedBox()
                            : Text(
                                "${"Refund policy".tr(context)} :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                        5.verticalSpace,
                        Text(
                          "${state.settings!.settings!.refundPolicy}",
                          style: TextStyle(height: 2),
                          textAlign:
                              isEnglish(state.settings!.settings!.refundPolicy!)
                                  ? TextAlign.left
                                  : TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
