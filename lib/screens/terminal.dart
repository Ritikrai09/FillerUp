import 'package:filler_up/colors/color_util.dart';

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
          const InlineWidget(text: 'Equipment / Terminal', isSubText: false),
          const DropList(
            text: 'Quantity',
            dropList: ['100', '200', '300', '400'],
          ),
          CheckBox(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            isChecked: isChecked,
          ),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 3.h),
                  width: 158.w,
                  height: 38.h,
                  hint: '8 AM to 12 PM',
                  controller: controller),
              TextFieldWidget(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 3.h),
                  width: 158.w,
                  height: 38.h,
                  readOnly: true,
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
