import 'package:filler_up/config/common_size.dart';
import 'package:filler_up/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../colors/color_util.dart';
import '../widgets/app_bar.dart';
import '../widgets/inline.dart';
import '../widgets/main_box.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isSeen = false;
  bool selectedIndex = false;
  List<String> time = [
    '4/12/2011 7.40 pm',
    '13/12/2011 7.40 pm',
    '11/12/2011 7.40 pm',
    '16/12/2011 7.40 pm',
    '23/12/2011 7.40 pm'
  ];
  List<String> addItem = [];
  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
        patternBackground: true,
        child: Column(children: [
          const TopAppBar(),
          SizedBox(height: defaultSize,),
          const InlineWidget(text: 'Notification', isSubText: false),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = addItem.contains(time[index]);
                  return ListWidget(
                    height: 100,
                    iconWidth: 40.sp,
                    icon: SvgPicture.asset('lib/assets/icons/bell.svg',
                        width: 20.w,
                        height: 20.h,
                        color: isSelected
                            ? ColorUtil.lightPrimaryColor
                            : Colors.white),
                    isSubText: true,
                    margin: EdgeInsets.only(bottom: 5.sp),
                    isSeen: isSelected,
                    iconBgColor: const Color.fromRGBO(34, 142, 154, 1),
                    subText: time[index],
                    onTap: () {
                      selected(time[index]);
                    },
                  );
                }),
          )
        ]));
  }

  void selected(String item) {
    selectedIndex = addItem.contains(item);
    setState(() {
      return selectedIndex ? null : addItem.add(item);
    });
  }
}
