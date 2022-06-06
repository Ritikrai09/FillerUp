import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/config/common_size.dart';

import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/button.dart';

import 'package:filler_up/widgets/text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/checkbox.dart';
import '../widgets/dropdown.dart';
import '../widgets/inline.dart';
import '../widgets/main_box.dart';
import '../widgets/screen.dart';

class Terminal extends StatefulWidget {
  const Terminal({Key? key}) : super(key: key);

  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  bool isChecked = false;
  String data = 'Date';
  late TextEditingController controller;
  late FocusNode focus, focus1, focus2;

  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
        patternBackground: true,
        child: Column(children: [
          const TopAppBar(),
          SizedBox(height: defaultSize,),
          const InlineWidget(text: 'Equipment / Terminal', isSubText: false),
          DropList(
            height: ScreenSize.isSmall(context)
                ? ScreenSize.isVerySmall(context)
                    ? MediaQuery.of(context).size.height * 0.076
                    : MediaQuery.of(context).size.height * 0.067
                : ScreenSize.isTabletWidth(context)
                    ? MediaQuery.of(context).size.height * 0.075
                    : MediaQuery.of(context).size.height * 0.064,
            text: 'Quantity',
            dropList: const ['100', '200', '300', '400'],
          ),
          CheckBox(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            isChecked: isChecked,
          ),
          SizedBox(height: defaultSize,),
          TextFieldWidget(
              hint: data,
              readOnly: true,
              icon: IconButton(
                  onPressed: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: ColorUtil.primaryColor, // <-- SEE HERE

                                onPrimary: Colors.white, // <-- SEE HERE
                                onSurface: ColorUtil
                                    .overlayPrimaryColor, // <-- SEE HERE
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 12.sp),
                                  primary: ColorUtil
                                      .primaryColor, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        });
                    if (pickDate != null) {
                      setState(() {
                        data =
                            '${pickDate.day}/${pickDate.month}/${pickDate.year}';
                      });
                    } else {
                      return;
                    }
                  },
                  icon: SvgPicture.asset('lib/assets/icons/date.svg')),
              controller: controller),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldWidget(
                  readOnly: true,
                  size: ScreenSize.isSmall(context) ? 14.sp : 14.sp,
                  textAlign: TextAlign.center,
                  width: MediaQuery.of(context).size.width * 0.405,
                  hint: '8 AM to 12 PM',
                  isIcon: false,
                  controller: controller),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width * 0.405,
                  readOnly: true,
                  size: ScreenSize.isSmall(context) ? 14.sp : 14.sp,
                  textAlign: TextAlign.center,
                  isIcon: false,
                  hint: '4 PM to 12 AM',
                  controller: controller),
            ],
          ),
          ButtonWidget(
            onPressed: () {},
            text: 'Next',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Gotham',
            ),
          )
        ]));
  }
}
