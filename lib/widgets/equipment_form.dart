import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/button.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/terminal.dart';

class EquipmentForm extends StatefulWidget {
  const EquipmentForm({Key? key}) : super(key: key);

  @override
  State<EquipmentForm> createState() => _EquipmentFormState();
}

class _EquipmentFormState extends State<EquipmentForm> {
  late TextEditingController addressController;
  late TextEditingController streetController;
  late TextEditingController cityController;
  late TextEditingController postalController;

  @override
  void initState() {
    addressController = TextEditingController();
    streetController = TextEditingController();
    cityController = TextEditingController();
    postalController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
        patternBackground: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopAppBar(
              trailing: Icons.arrow_back,
            ),
            const InlineWidget(text: 'Equipment', subText: ''),
            SizedBox(height: 15.h),
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
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const Terminal()));
              },
              text: 'Next',
            )
          ],
        ));
  }
}
