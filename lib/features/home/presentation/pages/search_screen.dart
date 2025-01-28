import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/pages/categories_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypeaheadExample extends StatefulWidget {
  final String categorryId;
  const TypeaheadExample({Key? key, required this.categorryId})
      : super(key: key);

  @override
  _TypeaheadExampleState createState() => _TypeaheadExampleState();
}

class _TypeaheadExampleState extends State<TypeaheadExample> {
  List<String> suggestions = [];

  Future<void> storeStringList(List<String> stringList) async {
    if (stringList.length > 10) {
      // Remove the oldest element (first element)
      stringList.removeAt(0);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('Suggestions_Search', stringList);
  }

  Future<List<String>>? getStringList() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList('Suggestions_Search') ?? [];
    return stringList;
  }

  Future<List<String>> _getSuggestions(String query) async {
    context.read<HomeCubit>().cahngesearchValue(query);

    suggestions = await getStringList() ?? [];
    List<String> matches = [];
    matches.addAll(suggestions);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  final TextEditingController _textController =
      TextEditingController(); // New controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Typeahead Example'),
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(children: [
                      TypeAheadField(
                        controller: _textController,
                        // suggestionsBoxDecoration:
                        //     SuggestionsBoxDecoration(color: Colors.white),
                        // textField: TextFieldConfiguration(
                        //     controller: _textController, // Use the controller

                        //     cursorColor: AppColors.primaryColor,
                        //     autofocus: true,
                        //     decoration:
                        //         InputDecoration(border: OutlineInputBorder())),
                        suggestionsCallback: (pattern) async {
                          return await _getSuggestions(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              suggestion,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                          );
                        },
                        onSelected: (String suggestion) {
                          setState(() {
                            _textController.text = suggestion;
                          });
                          context
                              .read<HomeCubit>()
                              .cahngesearchValue(suggestion);
                        },
                      ),
                      PositionedDirectional(
                          end: 5,
                          top: 10,
                          child: InkWell(
                            onTap: () {
                              if (state.searchValue!.isNotEmpty) {
                                suggestions.add(state.searchValue!);
                                storeStringList(suggestions);
                                context
                                    .read<HomeCubit>()
                                    .EditeVariableForSearch();
                                context
                                    .read<HomeCubit>()
                                    .cahngedontshowSearchIcon(true);
                                Navigator.pop(context);
                                context.read<HomeCubit>().getSubCategoriesInfo(
                                    context, widget.categorryId);
                              }
                            },
                            child: Icon(
                              Icons.send,
                              color: AppColors.primaryColor,
                            ),
                          ))
                    ]),
                    20.verticalSpace,
                    Text(
                      "Browse the rest of the sections to find more products."
                          .tr(context),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return BlocBuilder<LocaleCubit, LocaleState>(
                          builder: (context, locale) {
                            return GridView.count(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              childAspectRatio: (1.0 / 1.0),
                              mainAxisSpacing: 30,
                              children: List.generate(
                                  state.homeInfo!.categories!.length, (index) {
                                return FadeInUp(
                                    child: InkWell(
                                  onTap: () {
                                    AppConstant.customNavigation(
                                        context,
                                        CategoriesScreen(
                                          title: locale.locale.languageCode ==
                                                  "en"
                                              ? state
                                                      .homeInfo!
                                                      .categories![index]
                                                      .nameEn ??
                                                  ""
                                              : locale.locale.languageCode ==
                                                      "ar"
                                                  ? state
                                                          .homeInfo!
                                                          .categories![index]
                                                          .nameAr ??
                                                      ""
                                                  : state
                                                          .homeInfo!
                                                          .categories![index]
                                                          .nameKu ??
                                                      "",
                                          categoryId: state
                                              .homeInfo!.categories![index].id
                                              .toString(),
                                        ),
                                        -1,
                                        0);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    width: 80,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      // shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 7.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          width: 125,
                                          height: 125,
                                          fit: BoxFit.fill,
                                          imageUrl: state
                                                  .homeInfo!
                                                  .categories![index]
                                                  .imageUrl ??
                                              "",
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          locale.locale.languageCode == "en"
                                              ? state
                                                      .homeInfo!
                                                      .categories![index]
                                                      .nameEn ??
                                                  ""
                                              : locale.locale.languageCode ==
                                                      "ar"
                                                  ? state
                                                          .homeInfo!
                                                          .categories![index]
                                                          .nameAr ??
                                                      ""
                                                  : state
                                                          .homeInfo!
                                                          .categories![index]
                                                          .nameKu ??
                                                      "",
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                              }),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
