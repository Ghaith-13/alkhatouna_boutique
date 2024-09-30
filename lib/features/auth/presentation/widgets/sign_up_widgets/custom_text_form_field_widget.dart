// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:alkhatouna/Locale/app_localization.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  TextInputType? textInputType;
  Function(String)? onChange;
  String hint;
  bool hideText;
  CustomTextFormFieldWidget(
      {super.key,
      this.textInputType,
      required this.hint,
      this.onChange,
      this.hideText = false});

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      keyboardType: widget.textInputType,
      obscureText: widget.hideText,
      decoration: InputDecoration(
        hintText: widget.hint.tr(context),
      ),
    );
  }
}
