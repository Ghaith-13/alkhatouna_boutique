import 'package:alkhatouna/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:alkhatouna/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BirthdayWidget extends StatefulWidget {
  TextEditingController birthdaycontroller;
  BirthdayWidget({super.key, required this.birthdaycontroller});

  @override
  State<BirthdayWidget> createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  TextEditingController birthdaycontroller = TextEditingController();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime tenYearsAgo = DateTime(now.year - 10, now.month, now.day);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: tenYearsAgo
          .subtract(const Duration(days: 1)), // Start just before 10 years ago
      firstDate: DateTime(1900), // Or some other very early date
      lastDate: tenYearsAgo.subtract(const Duration(days: 1)),
    );
    if (pickedDate != null) {
      String dateOnly = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        widget.birthdaycontroller.text = dateOnly;
      });
      context.read<AuthCubit>().changeBirthdateValue(dateOnly);
      // final TimeOfDay? pickedTime = await showTimePicker(
      //   context: context,
      //   initialTime: TimeOfDay.now(),
      // );
      // if (pickedTime != null) {
      //   setState(() {});
      // }
    } else {
      setState(() {
        widget.birthdaycontroller.text = "";
      });
      context.read<AuthCubit>().changeBirthdateValue("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      canRequestFocus: false,
      controller: widget.birthdaycontroller,
      onTap: () {
        _selectDateTime(context);
      },
      hint: "Your birthday",
      hideText: false,
    );
  }
}
