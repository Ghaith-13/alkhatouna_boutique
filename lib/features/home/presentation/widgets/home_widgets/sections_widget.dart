import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return GridView.count(
              padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              childAspectRatio: (1.0 / 1.8),
              mainAxisSpacing: 30,
              children:
                  List.generate(state.homeInfo!.categories!.length, (index) {
                return FadeInUp(
                    child: OneSectionWidget(
                        categoryId:
                            state.homeInfo!.categories![index].id.toString(),
                        logo: state.homeInfo!.categories![index].imageUrl ?? "",
                        title: locale.locale.languageCode == "en"
                            ? state.homeInfo!.categories![index].nameEn ?? ""
                            : locale.locale.languageCode == "ar"
                                ? state.homeInfo!.categories![index].nameAr ??
                                    ""
                                : state.homeInfo!.categories![index].nameKu ??
                                    ""));
              }),
            );
          },
        );
      },
    );
  }
}
