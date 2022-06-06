import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/button.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'terminal.dart';
import '../widgets/screen.dart';

class EquipmentForm extends StatefulWidget {
  const EquipmentForm({Key? key}) : super(key: key);

  @override
  State<EquipmentForm> createState() => _EquipmentFormState();
}

class _EquipmentFormState extends State<EquipmentForm> {
  late TextEditingController addressController = TextEditingController();
  late TextEditingController streetController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController postalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
        patternBackground: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopAppBar(),
            const InlineWidget(text: 'Equipment', isSubText: false),
            SizedBox(height: ScreenSize.isVerySmall(context) ? 20.h : 15.h),
            Wrap(
              children: [
                TextFieldWidget(
                  controller: addressController,
                  hint: 'Address',
                ),
                TextFieldWidget(
                  controller: streetController,
                  hint: 'Street, Block No',
                ),
                TextFieldWidget(
                  controller: cityController,
                  hint: 'City',
                ),
                TextFieldWidget(
                  controller: postalController,
                  hint: 'Postal Code',
                ),
                ButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Terminal()));
                  },
                  text: 'Next',
                ),
              ],
            )
          ],
        ));
  }
}
