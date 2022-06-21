import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final bool hide, isLabelled, readOnly;
  final IconButton? icon;
  final bool isIcon;
  final String? label;
  final TextAlign? textAlign;
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
    this.textAlign,
    this.hint = '',
    this.margin,
    this.width,
    this.isIcon = true,
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
                Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  child: Text(widget.label ?? '',
                      style: TextStyle(
                          fontSize:
                              ScreenSize.isTabletWidth(context) ? 10.sp : 14.sp,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.w500,
                          color: ColorUtil.lightPrimaryColor)),
                ),
              ])
            : ScreenSize.isTabletWidth(context)
                ? SizedBox(
                    height: 8.h,
                  )
                : const SizedBox(),
        Container(
          width: widget.width ?? MediaQuery.of(context).size.width * 0.855,
          height: ScreenSize.isSmall(context)
              ? ScreenSize.isVerySmall(context)
                  ? MediaQuery.of(context).size.height * 0.082
                  : MediaQuery.of(context).size.height * 0.067
              : ScreenSize.isTabletWidth(context)
                  ? MediaQuery.of(context).size.height * 0.075
                  : MediaQuery.of(context).size.height * 0.064,
          margin: widget.margin ?? EdgeInsets.only(bottom: 25.h),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2.w, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(16.r))),
          child: Theme(
            child: TextFormField(
              readOnly: widget.readOnly,
              textAlign: widget.textAlign ?? TextAlign.left,
              controller: widget.controller,
              obscureText: widget.hide,
              style: TextStyle(
                  fontSize: ScreenSize.isTabletWidth(context)
                      ? 16.sp
                      : widget.size ?? 14.sp,
                  height: ScreenSize.isVerySmall(context) ? 2.h : 1.h,
                  fontFamily: 'Gotham-Bold',
                  ),

              keyboardType: widget.keyboard ?? TextInputType.text,
              decoration: InputDecoration(
                  contentPadding: widget.padding ??
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  suffixIcon: widget.isIcon
                      ? FittedBox(
                          child: widget.icon,
                        )
                      : null,
                  suffixIconColor: ColorUtil.primaryColor,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      fontSize: ScreenSize.isTabletWidth(context)
                          ? 10.sp
                          : widget.size ?? 14.sp,
                      height: ScreenSize.isVerySmall(context) ? 2.h : 1.h,
                      fontFamily: 'Gotham-Bold',
                      color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true),
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
