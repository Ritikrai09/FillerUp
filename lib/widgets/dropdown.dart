import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/color_util.dart';
import 'screen.dart';

// ignore: must_be_immutable
class DropList extends StatefulWidget {
  final List<String>? dropList;
  final String? image;
  final String? text, initialValue;
  final double? width, height;

  final EdgeInsetsGeometry? margin;

  const DropList(
      {Key? key,
      this.width,
      this.height,
      this.image,
      this.dropList,
      this.margin,
      this.initialValue,
      this.text})
      : super(key: key);

  @override
  State<DropList> createState() => _DropListState();
}

class _DropListState extends State<DropList> {
  String? value;

  @override
  void initState() {
    if (this.value != widget.initialValue) {
      setState(() {
        this.value = widget.initialValue;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? 325.w,
        height: widget.height ?? 50.h,
        padding: EdgeInsets.all(8.sp),
        margin: widget.margin ?? EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
            color: ColorUtil.lightWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(16.r))),
        child: (widget.image == null)
            ? DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Container(
                    width: 170.w,
                    height: 50.h,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.text ?? "How many gallons",
                      style: TextStyle(
                          fontSize: ScreenSize.isSmall(context) ? 12.sp : 16.sp,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400]),
                    ),
                  ),
                  isExpanded: true,
                  icon: const FittedBox(
                      fit: BoxFit.contain, child: Icon(Icons.arrow_drop_down)),
                  alignment: AlignmentDirectional.centerStart,
                  value: value,
                  items: widget.dropList!.map((String value) {
                    return DropdownMenuItem(
                        value: value,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.66,
                            height: 30.h,
                            child: Text(
                              value,
                              style: TextStyle(
                                  height: ScreenSize.isTabletHeight(context)
                                      ? 1.7.h
                                      : 1.h,
                                  fontSize: ScreenSize.isSmall(context)
                                      ? 14.sp
                                      : 16.sp,
                                  color: ColorUtil.primaryColor),
                            )));
                  }).toList(),
                  onChanged: (value) => setState(() {
                    this.value = value ?? widget.initialValue;
                  }),
                ),
              )
            : DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 0.0,
                  underline: const SizedBox(),
                  alignment: AlignmentDirectional.centerEnd,
                  value: value,
                  items: widget.dropList!.map((String value) {
                    return DropdownMenuItem(
                        value: value,
                        child: SizedBox(
                          width: 48.w,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                widget.image!,
                                width: 22.w,
                                height: 22.h,
                              ),
                              Text(
                                value,
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Gotham',
                                    fontSize: 12.5.sp),
                              )
                            ],
                          ),
                        ));
                  }).toList(),
                  onChanged: (value) => setState(() {
                    this.value = value ?? widget.initialValue;
                  }),
                ),
              ));
  }
}
