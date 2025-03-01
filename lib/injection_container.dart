import 'package:alkhatouna/features/all_products/data/datasources/all_products_ds.dart';
import 'package:alkhatouna/features/all_products/data/repositories/all_products_repo.dart';
import 'package:alkhatouna/features/all_products/presentation/cubit/all_products_cubit.dart';
import 'package:alkhatouna/features/auth/data/datasources/sign_up_ds.dart';
import 'package:alkhatouna/features/auth/data/repositories/sign_up_repo.dart';
import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alkhatouna/features/cart/data/datasources/cart_ds.dart';
import 'package:alkhatouna/features/cart/data/repositories/cart_repo.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/favorite/data/datasources/favorite_ds.dart';
import 'package:alkhatouna/features/favorite/data/repositories/favorite_repo.dart';
import 'package:alkhatouna/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:alkhatouna/features/home/data/datasources/home_ds.dart';
import 'package:alkhatouna/features/profile/data/datasources/profile_ds.dart';
import 'package:alkhatouna/features/profile/data/repositories/profile_repo.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:alkhatouna/Locale/cubit/locale_cubit.dart';
import 'package:alkhatouna/features/home/data/repositories/home_Repo.dart';
import 'package:alkhatouna/features/home/presentation/cubit/home_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/http_helper.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton(
      () => ApiBaseHelper("https://alkhatuna-boutique.com/api"));
  ////////////////Cubit////////////////
  sl.registerFactory(() => HomeCubit(homeRepo: sl()));
  sl.registerFactory(() => AuthCubit(signUpRepo: sl()));
  sl.registerFactory(() => FavoriteCubit(favoriteRepo: sl()));
  sl.registerFactory(() => CartCubit(cartRepo: sl()));
  sl.registerFactory(() => ProfileCubit(profileRepo: sl()));
  sl.registerFactory(() => AllProductsCubit(allProductsRepo: sl()));
  ///////////////Repo////////////////
  sl.registerLazySingleton(() => HomeRepo(dataSource: sl()));
  sl.registerLazySingleton(() => SignUpRepo(dataSource: sl()));
  sl.registerLazySingleton(() => FavoriteRepo(dataSource: sl()));
  sl.registerLazySingleton(() => CartRepo(dataSource: sl()));
  sl.registerLazySingleton(() => ProfileRepo(dataSource: sl()));
  sl.registerLazySingleton(() => AllProductsRepo(dataSource: sl()));
  ///////////////DS////////////////
  sl.registerLazySingleton(() => HomeDs(apiHelper: sl()));
  sl.registerLazySingleton(() => SignUpDs(apiHelper: sl()));
  sl.registerLazySingleton(() => FavoriteDs(apiHelper: sl()));
  sl.registerLazySingleton(() => CartDS(apiHelper: sl()));
  sl.registerLazySingleton(() => ProfileDs(apiHelper: sl()));
  sl.registerLazySingleton(() => AllProductsDS(apiHelper: sl()));
  /////////////////////////////////////////////////
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerFactory(() => LocaleCubit());
}
