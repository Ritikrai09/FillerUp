import 'package:filler_up/colors/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final bool hide, isLabelled, readOnly;
  final IconButton? icon;
  final String? label;
  final EdgeInsetsGeometry? margin;
  final double? size, width, height;
  final TextInputType? keyboard;

  final EdgeInsetsGeometry? padding;
  const TextFieldWidget({
    Key? key,
    this.size,
    required this.controller,
    this.isLabelled = false,
    this.label,
    this.keyboard,
    this.icon,
    this.hint = '',
    this.margin,
    this.width,
    this.padding,
    this.height,
    this.readOnly = false,
    this.hide = false,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.isLabelled
            ? Row(children: [
                Text(widget.label ?? '',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.lightPrimaryColor)),
                SizedBox(height: 40.h)
              ])
            : const SizedBox(),
        Container(
          width: widget.width ?? 320.w,
          height: widget.height ?? 48.h,
          margin: widget.margin ?? EdgeInsets.only(bottom: 25.h),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2.0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(16.r))),
          child: Theme(
            child: TextFormField(
              readOnly: widget.readOnly,
              controller: widget.controller,
              obscureText: widget.hide,
              keyboardType: widget.keyboard ?? TextInputType.text,
              decoration: InputDecoration(
                contentPadding: widget.padding ??
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
                suffixIcon: widget.icon,
                suffixIconColor: ColorUtil.primaryColor,
                hintText: widget.hint,
                hintStyle: TextStyle(
                    fontSize: widget.size ?? 14.sp,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[400]),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
            data: ThemeData().copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: ColorUtil.primaryColor,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
