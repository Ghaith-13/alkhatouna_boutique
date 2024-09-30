// ignore_for_file: must_be_immutable

import 'package:alkhatouna/features/cart/data/models/get_address_model.dart';
import 'package:alkhatouna/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:alkhatouna/features/cart/presentation/pages/shipping_addresses_skeleton.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/shipping_addresses_widgets/area_drop_down.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/shipping_addresses_widgets/country_drop_down.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/shipping_addresses_widgets/province_drop_down.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/shipping_addresses_widgets/sub_areas_dro_down.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';

class AddNewAddress extends StatefulWidget {
  final bool update;
  final Addresses? address;
  String? lat, log;
  AddNewAddress(
      {super.key, this.update = false, this.lat, this.log, this.address});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  late double lat = 0.0, log = 0.0;
  LatLng currentCenter = LatLng(0, 0);
  double currentZoom = 13.0;
  bool isDefault = false;
  // MapController mapController = MapController();
  bool loadingLocation = false;
  void check() async {
    setState(() {
      loadingLocation = true;
    });
    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {}

    await Geolocator.requestPermission();
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = pos.latitude;
      log = pos.longitude;
      currentCenter = LatLng(lat, log);
    });

    setState(() {
      loadingLocation = false;
    });
  }

  // void _zoom() {
  //   currentZoom = currentZoom - 1;
  //   mapController.move(currentCenter, currentZoom);
  // }
  Future update() async {
    setState(() {
      loadingLocation = true;
    });
    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {}
    await Geolocator.requestPermission();
    // Position pos = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    if (widget.update) {
      setState(() {
        lat = double.parse(widget.lat!);
        log = double.parse(widget.log!);
        currentCenter = LatLng(lat, log);
      });

      context.read<CartCubit>().editeAdress(widget.address!);
      if (widget.address!.isDefault == "0") {
        setState(() {
          isDefault = false;
        });
      } else {
        setState(() {
          isDefault = true;
        });
      }
    }
    setState(() {
      loadingLocation = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.update) {
      update();
    } else {
      check();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<CartCubit>().exitFromAddAdress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FadeIn(
        delay: Duration(milliseconds: 500),
        animate: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 1.sw,
              height: 48.h,
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        if (state.loadingAddAdress) {
                        } else {
                          if (widget.update) {
                            if (state.countryId == "-100") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "Choose country".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else if (state.provinceId == "-100") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "Choose province".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else {
                              context.read<CartCubit>().addAdress(context,
                                  widget.log.toString(), widget.lat.toString(),
                                  addressID: widget.address!.id.toString());
                            }
                          } else {
                            if (state.addressTitle!.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "Add title".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else if (state.addressPhoneNumber!.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "Add phone number".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else if (state.countryId == "-100") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "Choose country".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else if (state.provinceId == "-100") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.only(
                                      bottom: 30.h,
                                      top: 30.h,
                                      left: 50.w,
                                      right: 50.w),
                                  content: Text(
                                    "Choose province".tr(context),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else {
                              context.read<CartCubit>().addAdress(
                                  context, log.toString(), lat.toString());
                            }
                          }
                        }
                      },
                      child: state.loadingAddAdress
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "SAVE ADDRESS".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 14.sp),
                            ));
                },
              )),
        ),
      ),
      appBar: AppConstant.customAppBar(
        context,
        widget.update ? "Editing Shipping Address" : "Adding Shipping Address",
        true,
        withTranslate: true,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: loadingLocation && widget.update
                ? ShippingAddressesSkeleton()
                : Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Column(
                      children: [
                        FadeInLeft(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              initialValue: state.addressTitle,
                              onChanged: (String value) {
                                context
                                    .read<CartCubit>()
                                    .changeaddressTitle(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Title".tr(context),
                                hintStyle:
                                    TextStyle(color: AppColors.greyColor),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                        ),
                        30.ph,
                        FadeInRight(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: state.addressPhoneNumber,
                              onChanged: (String value) {
                                context
                                    .read<CartCubit>()
                                    .changeaddressPhoneNumber(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Phone Number".tr(context),
                                hintStyle:
                                    TextStyle(color: AppColors.greyColor),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                        ),
                        30.ph,
                        FadeInLeft(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              initialValue: state.adressNotes,
                              onChanged: (String value) {
                                context
                                    .read<CartCubit>()
                                    .changeadressNotes(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Notes".tr(context),
                                hintStyle:
                                    TextStyle(color: AppColors.greyColor),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                        ),
                        30.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FadeInLeft(child: CountryDropDown()),
                            FadeInRight(child: ProvinceDropDown()),
                          ],
                        ),
                        30.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FadeInLeft(child: AreaDropDown()),
                            FadeInRight(child: SubAreasDroDown()),
                          ],
                        ),
                        30.ph,
                        Row(
                          children: [
                            SizedBox(
                              width: 20.sp,
                              height: 20.sp,
                              child: Checkbox(
                                checkColor: Colors.white,
                                activeColor: AppColors.primaryColor,
                                value: isDefault,
                                onChanged: (value) {
                                  setState(() {
                                    isDefault = value!;
                                  });
                                  if (value!) {
                                    context
                                        .read<CartCubit>()
                                        .changeadressIsDefault("1");
                                  } else {
                                    context
                                        .read<CartCubit>()
                                        .changeadressIsDefault("0");
                                  }
                                },
                              ),
                            ),
                            5.pw,
                            Text(
                              "Use as the shipping address".tr(context),
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        30.ph,
                        loadingLocation
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18.sp),
                                  child: Container(
                                    color: Colors.black,
                                    width: 1.sw,
                                    height: 0.4.sh,
                                  ),
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(18.sp),
                                child: SizedBox(
                                  height: 0.4.sh,
                                  child: FlutterMap(
                                    // mapController: mapController,
                                    options: MapOptions(
                                      initialCenter: LatLng(lat, log),
                                      // zoom: 15,
                                      // center: widget.update
                                      //     ? LatLng(
                                      //         double.parse(widget.lat!), double.parse(widget.log!))
                                      //     : LatLng(lat, log),
                                      onPositionChanged: (MapCamera position,
                                          bool hasGesture) {
                                        if (widget.update) {
                                          setState(() {
                                            widget.lat = position
                                                .center.latitude
                                                .toString();
                                            widget.log = position
                                                .center.longitude
                                                .toString();
                                          });
                                        } else {
                                          setState(() {
                                            lat = position.center.latitude;
                                            log = position.center.longitude;
                                          });
                                        }
                                      },
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName:
                                            'dev.fleaflet.flutter_map.example',
                                      ),
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            width: 30.0,
                                            height: 30.0,
                                            point: widget.update
                                                ? LatLng(
                                                    double.parse(widget.lat!),
                                                    double.parse(widget.log!))
                                                : LatLng(lat, log),
                                            child: Icon(Icons.location_on,
                                                size: 30.sp,
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        10.ph,

                        // 30.ph,
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
