import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alkhatouna/features/home/presentation/widgets/sections_widgets/one_section_widget.dart';

class SectionDetailsWidget extends StatefulWidget {
  const SectionDetailsWidget({super.key});

  @override
  State<SectionDetailsWidget> createState() => _SectionDetailsWidgetState();
}

class _SectionDetailsWidgetState extends State<SectionDetailsWidget> {
  List<String> categoriesNames = [
    "red pen",
    "Makeup pencil",
    "ُEyeLiner",
    "Eye Shadow",
    "sunscreen"
  ];
  List<String> catimages = [
    "assets/images/red_pen.png",
    "assets/images/make_up_pen.jpg",
    "assets/images/Eyeliner.png",
    "assets/images/Eye_Shadow.jpg",
    "assets/images/sunscreen.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: GridView.count(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        // crossAxisSpacing: 15,
        childAspectRatio: (0.75 / 0.9),
        children: List.generate(categoriesNames.length, (index) {
          return index % 2 == 0
              ? FadeInLeft(
                  child: SectionCardWidget(
                      title: categoriesNames[index], image: catimages[index]))
              : FadeInRight(
                  child: SectionCardWidget(
                      title: categoriesNames[index], image: catimages[index]));
        }),
      ),
    );
  }
}
