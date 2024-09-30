// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:alkhatouna/features/all_products/data/models/all_products_model.dart';
import 'package:alkhatouna/features/all_products/data/repositories/all_products_repo.dart';
import 'package:alkhatouna/features/all_products/presentation/cubit/all_products.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  final AllProductsRepo allProductsRepo;

  AllProductsCubit({required this.allProductsRepo}) : super(AllProductsState());
  Future exitAllProductsScreen() async {
    emit(
        state.copyWith(stopLoading: false, pageNumber: 1, allProductsData: []));
  }

  Future<void> getAllProducts(
    BuildContext context,
    String? type,
  ) async {
    if (state.pageNumber == 1) {
      emit(state.copyWith(loadingproducts: true));
    }
    try {
      if (state.stopLoading == false) {
        AllProductsModel response =
            await allProductsRepo.getAllProducts(state.pageNumber, type);
        if (response.data!.length < 20) {
          emit(state.copyWith(stopLoading: true));
        }
        if (state.pageNumber == 1) {
          emit(state.copyWith(allProductsData: response.data));
        } else {
          List<ProductData>? newAllProducts = state.allProductsData ?? [];
          newAllProducts.addAll(response.data!);
          emit(state.copyWith(allProductsData: newAllProducts));
        }
        emit(state.copyWith(pageNumber: state.pageNumber + 1));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          padding:
              EdgeInsets.only(bottom: 30.h, top: 30.h, left: 50.w, right: 50.w),
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    emit(state.copyWith(loadingproducts: false));
  }
}
