// ignore_for_file: must_be_immutable

import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:alkhatouna/Locale/app_localization.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  TextInputType? textInputType;
  Function(String)? onChange;
  Function()? onTap;
  String hint;
  bool hideText;
  bool canRequestFocus;
  TextEditingController? controller;
  CustomTextFormFieldWidget({
    super.key,
    this.textInputType,
    required this.hint,
    this.onChange,
    this.controller,
    this.onTap,
    this.hideText = false,
    this.canRequestFocus = true,
  });

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      hidetext = widget.hideText;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller?.dispose();
  }

  bool hidetext = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      canRequestFocus: widget.canRequestFocus,
      controller: widget.controller,
      onTap: widget.onTap,
      onChanged: widget.onChange,
      keyboardType: widget.textInputType,
      obscureText: hidetext,
      decoration: InputDecoration(
        hintText: widget.hint.tr(context),
        suffixIcon: widget.canRequestFocus == false
            ? Icon(
                Icons.calendar_today,
                color: AppColors.primaryColor,
              )
            : widget.hideText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        hidetext = !hidetext;
                      });
                    },
                    icon: hidetext
                        ? Icon(
                            Icons.visibility,
                            color: AppColors.primaryColor,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ), // Replace with your desired icon
                  )
                : SizedBox(),
      ),
    );
  }
}
