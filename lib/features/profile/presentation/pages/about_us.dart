import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
        "About us".tr(context),
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
                  child: Lottie.asset('assets/images/loading.json'),
                )
              : state.settings!.settings!.aboutUs == null
                  ? SizedBox()
                  : Padding(
                      padding: EdgeInsets.all(12.0.sp),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "${state.settings!.settings!.aboutUs}",
                              style: TextStyle(height: 2),
                              textAlign:
                                  isEnglish(state.settings!.settings!.aboutUs!)
                                      ? TextAlign.left
                                      : TextAlign.right,
                            )
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
