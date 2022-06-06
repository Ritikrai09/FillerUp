import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/colors/design.dart';
import 'package:filler_up/config/common_size.dart';
import 'package:filler_up/widgets/behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBoxWidget extends StatelessWidget {
  final Widget child;
  final bool isScrollable;
  final bool patternBackground;
  const MainBoxWidget(
      {Key? key,
      required this.child,
      this.patternBackground = false,
      this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: CustomScrollView(
              physics: isScrollable
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: patternBackground
                        ? Design(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    24.w,
                                    defaultSize*2.5,
                                    24.w,
                                    0),
                                child: child))
                        : Container(
                            child: child,
                            decoration: const BoxDecoration(
                                color: ColorUtil.primaryColor),
                          ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
