import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewArrivalWidget extends StatefulWidget {
  const NewArrivalWidget({super.key});

  @override
  State<NewArrivalWidget> createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<NewArrivalWidget> {
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
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: (1 / 2),
              children:
                  List.generate(state.homeInfo!.new_arrival!.length, (index) {
                return FadeInUp(
                    child: ProductCardWidget(
                  fromSimilarProduct: false,
                  fromHome: true,
                  productDetails: Products(
                      points: state.homeInfo!.new_arrival![index].points,
                      displayProduct:
                          state.homeInfo!.new_arrival![index].displayProduct,
                      finalPrice:
                          state.homeInfo!.new_arrival![index].finalPrice,
                      discount: state.homeInfo!.new_arrival![index].discount,
                      id: state.homeInfo!.new_arrival![index].id,
                      imageUrl: state.homeInfo!.new_arrival![index].imageUrl,
                      isDiscount:
                          state.homeInfo!.new_arrival![index].isDiscount,
                      isFavorite:
                          state.homeInfo!.new_arrival![index].is_favorite,
                      nameAr: state.homeInfo!.new_arrival![index].nameAr,
                      nameEn: state.homeInfo!.new_arrival![index].nameEn,
                      nameKu: state.homeInfo!.new_arrival![index].nameKu,
                      isFeatured:
                          state.homeInfo!.new_arrival![index].isFeatured,
                      price: state.homeInfo!.new_arrival![index].price,
                      reviewAvg: state.homeInfo!.new_arrival![index].reviewAvg,
                      reviewCount:
                          state.homeInfo!.new_arrival![index].reviewCount),
                ));
              }),
            );
          },
        );
      },
    );
  }
}
