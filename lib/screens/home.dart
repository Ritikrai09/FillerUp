import 'package:filler_up/config/common_size.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/button.dart';
import 'package:filler_up/widgets/checkbox.dart';
import 'package:filler_up/widgets/dropdown.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
      patternBackground: true,
      child: Column(
        children: [
          const TopAppBar(),
          SizedBox(height: defaultSize,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const InlineWidget(
                text: 'Home',
                isSubText: false,
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('lib/assets/icons/edit.svg'))
            ],
          ),
          const DropList(
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
          SizedBox(height: defaultSize,),
          ButtonWidget(
            onPressed: () {},
            text: 'Next',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Gotham',
            ),
          )
        ],
      ),
    );
  }
}
