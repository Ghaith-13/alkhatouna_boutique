import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FaqQuestionsScreen extends StatefulWidget {
  const FaqQuestionsScreen({super.key});

  @override
  State<FaqQuestionsScreen> createState() => _FaqQuestionsScreenState();
}

class _FaqQuestionsScreenState extends State<FaqQuestionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getFaq(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(
        context,
        "Frequently Asked Questions".tr(context),
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.laodingFaq
              ? Center(
                  child: Lottie.asset('assets/images/loading.json'),
                )
              : state.faqData == null
                  ? Center(
                      child: Column(
                      children: [
                        Lottie.asset('assets/images/empty_data.json'),
                        Text("There are not questions".tr(context)),
                      ],
                    ))
                  : state.faqData!.faqs == null
                      ? Center(
                          child: Column(
                          children: [
                            Lottie.asset('assets/images/empty_data.json'),
                            Text("There are not questions".tr(context)),
                          ],
                        ))
                      : state.faqData!.faqs!.length == 0
                          ? Center(
                              child: Column(
                              children: [
                                Lottie.asset('assets/images/empty_data.json'),
                                Text("There are not questions".tr(context)),
                              ],
                            ))
                          : BlocBuilder<LocaleCubit, LocaleState>(
                              builder: (context, locale) {
                                return Padding(
                                  padding: EdgeInsets.all(12.0.sp),
                                  child: ListView.builder(
                                    itemCount: state.faqData!.faqs!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${index + 1} - ${locale.locale.languageCode == "en" ? state.faqData!.faqs![index].questionEn ?? "" : locale.locale.languageCode == "ar" ? state.faqData!.faqs![index].questionAr ?? "" : state.faqData!.faqs![index].questionKu}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          5.ph,
                                          Text(
                                            "   - ${locale.locale.languageCode == "en" ? state.faqData!.faqs![index].answerEn ?? "" : locale.locale.languageCode == "ar" ? state.faqData!.faqs![index].answerAr ?? "" : state.faqData!.faqs![index].answerAr}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          30.ph
                                        ],
                                      );
                                    },
                                  ),
                                );
                              },
                            );
        },
      ),
    );
  }
}
