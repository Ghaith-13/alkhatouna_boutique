import 'package:animate_do/animate_do.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/payment_methods_widgets/add_payment_sheet.dart';
import 'package:alkhatouna/features/cart/presentation/widgets/payment_methods_widgets/one_payment_method_widget.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          showFlexibleBottomSheet(
            bottomSheetColor: AppColors.whiteColor,
            barrierColor: Color.fromARGB(94, 83, 83, 83),
            bottomSheetBorderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.sp),
                topRight: Radius.circular(40.sp)),
            minHeight: 0,
            initHeight: 0.7,
            maxHeight: 0.7,
            anchors: [0, 0.7],
            isSafeArea: true,
            context: context,
            builder: addPaymentBottomSheet,
          );
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
        "Payment methods",
        true,
        withTranslate: true,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0.sp),
              child: Text(
                "Your payment cards".tr(context),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? FadeInLeft(child: OnePaymentMethodWidget())
                    : FadeInRight(child: OnePaymentMethodWidget());
              },
            ),
          ],
        ),
      ),
    );
  }
}
