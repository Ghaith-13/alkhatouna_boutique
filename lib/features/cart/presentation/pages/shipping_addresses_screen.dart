import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/cart/presentation/pages/shipping_addresses_skeleton.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/presentation/pages/add_new_address.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/shipping_addresses_widgets/one_shipping_address.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ShippingAddressesScreen extends StatefulWidget {
  const ShippingAddressesScreen({super.key});

  @override
  State<ShippingAddressesScreen> createState() =>
      _ShippingAddressesScreenState();
}

class _ShippingAddressesScreenState extends State<ShippingAddressesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getAdress(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: state.loadingAddress
              ? SizedBox()
              : InkWell(
                  onTap: () {
                    AppConstant.customNavigation(
                        context, AddNewAddress(), -1, 0);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
          appBar: AppConstant.customAppBar(
            context,
            "Shipping addresses",
            true,
            withTranslate: true,
            IconColor: AppColors.blackColor,
            backgroundColor: Colors.white,
            elvation: 0,
          ),
          body: state.loadingAddress
              ? ShippingAddressesSkeleton()
              : state.adressData == null
                  ? ShippingAddressesSkeleton()
                  : state.adressData!.addresses == null
                      ? Center(
                          child: Column(
                          children: [
                            Lottie.asset('assets/images/empty_data.json'),
                            Text("You do not have any addresses yet."
                                .tr(context)),
                          ],
                        ))
                      : state.adressData!.addresses!.isEmpty
                          ? Center(
                              child: Column(
                              children: [
                                Lottie.asset('assets/images/empty_data.json'),
                                Text("You do not have any addresses yet."
                                    .tr(context)),
                              ],
                            ))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.adressData!.addresses == null
                                  ? 0
                                  : state.adressData!.addresses!.length,
                              itemBuilder: (context, index) {
                                return index % 2 == 0
                                    ? FadeInLeft(
                                        child: OneShippingAddress(
                                        adress:
                                            state.adressData!.addresses![index],
                                      ))
                                    : FadeInRight(
                                        child: OneShippingAddress(
                                            adress: state.adressData!
                                                .addresses![index]));
                              },
                            ),
        );
      },
    );
  }
}
