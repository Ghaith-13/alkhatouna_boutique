import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/bloc_provider.dart';
import 'package:alkhatouna/config/themes/app_themes.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

class SendAdviceAndConsultScreen extends StatefulWidget {
  final String title;
  const SendAdviceAndConsultScreen({super.key, required this.title});

  @override
  State<SendAdviceAndConsultScreen> createState() =>
      _SendAdviceAndConsultScreenState();
}

class _SendAdviceAndConsultScreenState
    extends State<SendAdviceAndConsultScreen> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    context.read<HomeCubit>().changesuggestionsName("");
    context.read<HomeCubit>().changesuggestionNumber("");
    context.read<HomeCubit>().changesuggestionText("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(context, widget.title, true),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormFieldWidget(
              hint: "Enter Your Name",
              onChange: (String value) {
                context.read<HomeCubit>().changesuggestionsName(value);
              },
            ),
            25.verticalSpace,
            Directionality(
              textDirection: TextDirection.ltr,
              child: IntlPhoneField(
                pickerDialogStyle:
                    PickerDialogStyle(backgroundColor: Colors.white),
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Enter Your PhoneNumer'.tr(context),
                  labelStyle: TextStyle(color: AppColors.greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IQ',
                onChanged: (phone) {
                  context.read<HomeCubit>().changesuggestionNumber("null");

                  try {
                    if (phone.isValidNumber()) {
                      context
                          .read<HomeCubit>()
                          .changesuggestionNumber(phone.completeNumber);

                      // print("Yesss");
                    } else {
                      return;
                    }
                  } catch (e) {
                    // print(e);
                  }
                },
              ),
            ),
            12.verticalSpace,
            TextFormField(
              maxLines: 6,
              onChanged: (value) {
                context.read<HomeCubit>().changesuggestionText(value);
              },
              decoration: InputDecoration(
                hintText: widget.title == "Free consultations"
                    ? "Write your consultation here".tr(context)
                    : "Write your suggestion here".tr(context),
              ),
            ),
            30.verticalSpace,
            SizedBox(
                width: 1.sw,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return state.sendSuggestion
                        ? SizedBox(
                            width: 50,
                            height: 50,
                            child: Lottie.asset("assets/images/loading.json"))
                        : ElevatedButton(
                            onPressed: () {
                              if (state.suggestionsName!.isEmpty) {
                                AppConstant.CustomAlert(
                                    context, "Enter Your Name", true, true);
                              } else if (state.suggestionNumber!.isEmpty) {
                                AppConstant.CustomAlert(context,
                                    "Enter Your PhoneNumer", true, true);
                              } else if (state.suggestionNumber! == "null") {
                                AppConstant.CustomAlert(context,
                                    "Enter Your PhoneNumer", true, true);
                              } else if (state.suggestionText!.isEmpty) {
                                AppConstant.CustomAlert(
                                    context,
                                    widget.title == "Free consultations"
                                        ? "Write your consultation here"
                                        : "Write your suggestion here",
                                    true,
                                    true);
                              } else {
                                context.read<HomeCubit>().sendSuggestion(
                                    context,
                                    widget.title == "Free consultations"
                                        ? true
                                        : false);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Send".tr(context),
                                style: TextStyle(color: Colors.white),
                              ),
                            ));
                  },
                ))
          ],
        ),
      )),
    );
  }
}
