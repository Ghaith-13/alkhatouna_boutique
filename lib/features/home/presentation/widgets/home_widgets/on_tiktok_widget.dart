import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/home/data/models/sub_categories_model.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:alkhatouna/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnTiktokWidget extends StatefulWidget {
  const OnTiktokWidget({super.key});

  @override
  State<OnTiktokWidget> createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<OnTiktokWidget> {
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
                  List.generate(state.homeInfo!.on_tiktok!.length, (index) {
                return FadeInUp(
                    child: ProductCardWidget(
                  fromSimilarProduct: false,
                  fromHome: true,
                  productDetails: Products(
                      displayProduct:
                          state.homeInfo!.on_tiktok![index].displayProduct,
                      finalPrice: state.homeInfo!.on_tiktok![index].finalPrice,
                      discount: state.homeInfo!.on_tiktok![index].discount,
                      id: state.homeInfo!.on_tiktok![index].id,
                      imageUrl: state.homeInfo!.on_tiktok![index].imageUrl,
                      isDiscount: state.homeInfo!.on_tiktok![index].isDiscount,
                      isFavorite: state.homeInfo!.on_tiktok![index].is_favorite,
                      nameAr: state.homeInfo!.on_tiktok![index].nameAr,
                      nameEn: state.homeInfo!.on_tiktok![index].nameEn,
                      nameKu: state.homeInfo!.on_tiktok![index].nameKu,
                      isFeatured: state.homeInfo!.on_tiktok![index].isFeatured,
                      price: state.homeInfo!.on_tiktok![index].price,
                      reviewAvg: state.homeInfo!.on_tiktok![index].reviewAvg,
                      reviewCount:
                          state.homeInfo!.on_tiktok![index].reviewCount),
                ));
              }),
            );
          },
        );
      },
    );
  }
}
