import 'package:alkhatouna/features/all_products/data/repositories/all_products_repo.dart';
import 'package:alkhatouna/features/all_products/presentation/cubit/all_products_cubit.dart';
import 'package:alkhatouna/features/auth/data/repositories/sign_up_repo.dart';
import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alkhatouna/features/cart/data/repositories/cart_repo.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/favorite/data/repositories/favorite_repo.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/profile/data/repositories/profile_repo.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/home/data/repositories/home_Repo.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'injection_container.dart' as di;

MultiBlocProvider blocMultiProvider({required child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => HomeCubit(
          homeRepo: di.sl<HomeRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => AuthCubit(
          signUpRepo: di.sl<SignUpRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => FavoriteCubit(
          favoriteRepo: di.sl<FavoriteRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => CartCubit(
          cartRepo: di.sl<CartRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => ProfileCubit(
          profileRepo: di.sl<ProfileRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => AllProductsCubit(
          allProductsRepo: di.sl<AllProductsRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => LocaleCubit()..getSavedLAnguage(),
      ),
    ],
    child: child,
  );
}
