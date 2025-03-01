import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithQoutaWidget extends StatefulWidget {
  const WithQoutaWidget({super.key});

  @override
  State<WithQoutaWidget> createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<WithQoutaWidget> {
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
                  List.generate(state.homeInfo!.with_qouta!.length, (index) {
                return FadeInUp(
                    child: ProductCardWidget(
                  fromSimilarProduct: false,
                  fromHome: true,
                  productDetails: Products(
                      points: state.homeInfo!.with_qouta![index].points,
                      displayProduct:
                          state.homeInfo!.with_qouta![index].displayProduct,
                      finalPrice: state.homeInfo!.with_qouta![index].finalPrice,
                      discount: state.homeInfo!.with_qouta![index].discount,
                      id: state.homeInfo!.with_qouta![index].id,
                      imageUrl: state.homeInfo!.with_qouta![index].imageUrl,
                      isDiscount: state.homeInfo!.with_qouta![index].isDiscount,
                      isFavorite:
                          state.homeInfo!.with_qouta![index].is_favorite,
                      nameAr: state.homeInfo!.with_qouta![index].nameAr,
                      nameEn: state.homeInfo!.with_qouta![index].nameEn,
                      nameKu: state.homeInfo!.with_qouta![index].nameKu,
                      isFeatured: state.homeInfo!.with_qouta![index].isFeatured,
                      price: state.homeInfo!.with_qouta![index].price,
                      reviewAvg: state.homeInfo!.with_qouta![index].reviewAvg,
                      reviewCount:
                          state.homeInfo!.with_qouta![index].reviewCount),
                ));
              }),
            );
          },
        );
      },
    );
  }
}
