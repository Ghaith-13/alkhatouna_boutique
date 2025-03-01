import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/user_categories_skeleton.dart';
import 'package:alkhatouna/features/home/presentation/widgets/home_widgets/one_user_categorey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCategoriesScreen extends StatefulWidget {
  const UserCategoriesScreen({super.key});

  @override
  State<UserCategoriesScreen> createState() => _UserCategoriesScreenState();
}

class _UserCategoriesScreenState extends State<UserCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getUserCategories(
          context,
        );
  }

  // final List<Tab> _tabs = [
  //   const Tab(
  //     icon: Icon(
  //       Icons.shield,
  //       color: Colors.black,
  //     ),
  //     // text: '',
  //     child: Text(
  //       "Normal",
  //       textAlign: TextAlign.center,
  //     ),
  //   ),
  //   Tab(
  //     icon: Icon(
  //       Icons.shield,
  //       color: Colors.grey,
  //     ),
  //     child: Text(
  //       "Silver",
  //       textAlign: TextAlign.center,
  //     ),
  //   ),
  //   // text: ''),
  //   Tab(
  //       icon: Icon(Icons.shield, color: Colors.yellow[700]),
  //       child: Text(
  //         "Gold",
  //         textAlign: TextAlign.center,
  //       )),
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, locale) {
            print(state.userCategoriesData);

            return state.loadingUserCategories
                ? UserCategoriesSkeleton()
                : DefaultTabController(
                    length: state.userCategoriesData?.categories?.length ?? 0,
                    child: Scaffold(
                      appBar: AppBar(
                        // iconTheme: IconThemeData(color: AppColors.primaryColor),
                        leading: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.blackColor,
                            )),
                        title: Text('User Categories'.tr(context)),
                        bottom: TabBar(
                          padding: EdgeInsets.all(0),
                          tabAlignment: TabAlignment.center,
                          isScrollable: true,
                          labelColor: AppColors.primaryColor,
                          indicatorColor: AppColors.primaryColor,
                          tabs: [
                            for (var item
                                in state.userCategoriesData!.categories!)
                              Tab(
                                  child: Text(
                                "${locale.locale.languageCode == "en" ? item.name : locale.locale.languageCode == "ar" ? item.nameAr : item.nameKu}",
                                textAlign: TextAlign.center,
                              )),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          for (var item
                              in state.userCategoriesData!.categories!)
                            OneUserCategorey(
                              categories: item,
                            )
                        ],
                        physics:
                            const NeverScrollableScrollPhysics(), // Prevent scrolling
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
