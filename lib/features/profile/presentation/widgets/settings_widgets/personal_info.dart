import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/presentation/pages/verfication_phone_address.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/features/profile/presentation/pages/add_newnumber_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personal Information".tr(context),
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600),
        ),
        20.ph,
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.userInfo!.phone == null
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const AddNewnumberScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Add mobile number".tr(context)),
                      ))
                  : TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  AppConstant.customNavigation(
                                      context,
                                      VerficationPhoneAddress(
                                          fromSetting: true,
                                          phoneNumber:
                                              state.userInfo?.phone ?? "",
                                          lat: "",
                                          log: ""),
                                      -1,
                                      0);
                                },
                                child: Text("Change".tr(context))),
                          ],
                        ),
                        hintText: state.userInfo!.phone == null
                            ? state.userInfo!.email
                            : state.userInfo!.phone.isEmpty
                                ? state.userInfo!.email
                                : state.userInfo!.phone,
                        hintStyle: TextStyle(color: AppColors.greyColor),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
