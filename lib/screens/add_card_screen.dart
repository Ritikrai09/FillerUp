import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/checkbox.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../config/card_number_formatter.dart';
import '../config/common_size.dart';
import '../widgets/button.dart';
import '../widgets/screen.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController cardNumberText = TextEditingController();
  TextEditingController cardNameText = TextEditingController();
  TextEditingController cardMonthText = TextEditingController();
  TextEditingController cardYearText = TextEditingController();
  TextEditingController cardCvvText = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
      patternBackground: true,
      child: Column(children: [
        const TopAppBar(),
        SizedBox(
          height: defaultSize,
        ),
        const InlineWidget(text: 'Add Card', isSubText: false),
        SizedBox(height: ScreenSize.isVerySmall(context) ? 20.h : 15.h),
        TextFieldWidget(
          controller: cardNumberText,
          hint: 'Card Number',
          keyboard: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CardNumberFormatter(),
            LengthLimitingTextInputFormatter(19),
          ],
        ),
        TextFieldWidget(
          controller: cardNameText,
          hint: 'Card Holder Name',
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                controller: cardMonthText,
                hint: 'Month',
                keyboard: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFieldWidget(
                controller: cardYearText,
                hint: 'Year',
                keyboard: TextInputType.number,
              ),
            ),
          ],
        ),
        TextFieldWidget(
          hide: true,
          controller: cardCvvText,
          hint: 'CVV',
          keyboard: TextInputType.number,
        ),
        CheckBox(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          isChecked: isChecked,
          text: "Payment on Delivery",
        ),
        ButtonWidget(
          onPressed: () {
            Get.defaultDialog(
                title: "Please Confirm",
                titleStyle: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Gotham-Bold',
                ),
                // middleTextStyle: TextStyle(color: Colors.white),
                content: orderConfirmDialog(),
                radius: 30);
          },
          text: 'Confirm Order',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Gotham',
          ),
        ),
      ]),
    );
  }
}

Widget orderConfirmDialog() {
  return SizedBox(
    height: 250,
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        "Super Unleaded",
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Gotham-Bold',
        ),
      ),
      const Text(
        "3.99",
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Gotham-Bold',
        ),
      ),
      const Text(
        "Friday,June 24,2022",
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Gotham-Bold',
        ),
      ),
      const Text(
        "08:00 AM - 06:00 PM",
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Gotham-Bold',
        ),
      ),
      const Text(
        "26, Jeremy Dr,East Lyme ,CT 06333,USA",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Gotham-Bold',
        ),
      ),
      ButtonWidget(
        onPressed: () {
          Get.back();
          Get.defaultDialog(
              content: Column(
                children: [
                  SvgPicture.asset(
                    "lib/assets/icons/confirm.svg",
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Thanks for using FillerUp!",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Gotham-Bold',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Your order has been generated successfully",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Gotham-Bold',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    onPressed: () {
                      Get.back();
                    },
                    text: 'Ok',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gotham',
                    ),
                  )
                ],
              ),
              radius: 30);
        },
        text: 'Confirmed',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'Gotham',
        ),
      )
    ]),
  );
}
