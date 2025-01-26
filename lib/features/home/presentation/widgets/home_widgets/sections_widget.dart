import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/config/themes/app_themes.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'one_section_widget.dart';

class SectionsWidget extends StatefulWidget {
  const SectionsWidget({super.key});

  @override
  State<SectionsWidget> createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<SectionsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, locale) {
            return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                width: 1.sw,
                child: Wrap(
                  spacing: 12.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.start,
                  children: List.generate(
                    state.homeInfo!.categories!.length,
                    (index) {
                      double childWidth = (MediaQuery.of(context).size.width -
                              (12 * 3) -
                              30.sp) /
                          4;

                      return SizedBox(
                        width: childWidth,
                        child: FadeInUp(
                          child: OneSectionWidget(
                            categoryId: state.homeInfo!.categories![index].id
                                .toString(),
                            logo: state.homeInfo!.categories![index].imageUrl ??
                                "",
                            title: locale.locale.languageCode == "en"
                                ? state.homeInfo!.categories![index].nameEn ??
                                    ""
                                : locale.locale.languageCode == "ar"
                                    ? state.homeInfo!.categories![index]
                                            .nameAr ??
                                        ""
                                    : state.homeInfo!.categories![index]
                                            .nameKu ??
                                        "",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
