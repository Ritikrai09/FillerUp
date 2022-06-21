import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:filler_up/colors/color_util.dart';
import 'package:filler_up/config/common_size.dart';
import 'package:filler_up/controller/profile_controller.dart';
import 'package:filler_up/widgets/app_bar.dart';
import 'package:filler_up/widgets/button.dart';
import 'package:filler_up/widgets/inline.dart';
import 'package:filler_up/widgets/main_box.dart';
import 'package:filler_up/widgets/menu.dart';
import 'package:filler_up/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../config/api_string.dart';
import '../config/user_info.dart';
import '../widgets/screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileController _profileController = Get.put(ProfileController());
  String imagePath = "" ;


  @override
  void initState() {
    _profileController.nameController.text =
        UserInformation.userData.value.data?.name ?? '';

    _profileController.emailController.text =
        UserInformation.userData.value.data?.email ?? '';
    _profileController.passController.text = '*********';
    _profileController.countryCode = getCountryCode();
    super.initState();
  }

  String getCountryCode(){
    int length = UserInformation.userData.value.data?.phone?.length??0;
    int countryCodeLength = 0;
    if(length>10){
       countryCodeLength = length - 10;
    }
    String countryCode = (UserInformation.userData.value.data?.phone)!.substring(0,countryCodeLength);

    _profileController.mobileController.text =
        (UserInformation.userData.value.data?.phone)?.substring(countryCodeLength)?? '';

    return countryCode;
  }

  @override
  Widget build(BuildContext context) {
    return MainBoxWidget(
      isScrollable: true,
      patternBackground: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopAppBar(
            color: Colors.transparent,
            onLeadingPressed: () {
              Navigator.pop(context);
            },
            leading: SvgPicture.asset(
              'lib/assets/icons/arrow.svg',
            ),
          ),
          const InlineWidget(text: 'Edit Account', isSubText: false),
          Expanded(
            child: SingleChildScrollView(
              child: ValueListenableBuilder(
                  valueListenable: UserInformation.userData,
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SplashIcon(
                                  height: ScreenSize.isSmall(context)
                                      ? ScreenSize.isVerySmall(context)
                                      ? MediaQuery.of(context).size.height *
                                      0.25
                                      : MediaQuery.of(context).size.height *
                                      0.30
                                      : 86.sp,
                                  size: ScreenSize.isSmall(context)
                                      ? 110.sp
                                      : ScreenSize.isSmallHeight(context)
                                      ? 115.sp
                                      : ScreenSize.isTabletWidth(context)
                                      ? 60.sp
                                      : 100.sp,
                                  icon: imagePath != ''
                                      ? SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: Image.file(
                                          File(imagePath)))
                                      : CachedNetworkImage(
                                    imageUrl:
                                    '${ApiStrings.prefixImageUrl}${UserInformation.userData.value.data!.image!}',
                                    placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                            'lib/assets/icons/avt-8.png',
                                            fit: BoxFit.fill),
                                  ),
                                ),
                                Positioned(
                                  bottom:
                                  MediaQuery.of(context).size.width * 0.05,
                                  right:
                                  MediaQuery.of(context).size.width * 0.01,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        color: Colors.white),
                                    child: ClipRect(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 18,
                                        child: SplashIcon(
                                          onPressed: () async {
                                            _profileController.image =
                                                (await _profileController.picker
                                                    .pickImage(
                                                    source: ImageSource
                                                        .gallery)) ??
                                                    XFile('');

                                            setState(() {
                                              imagePath =
                                                  _profileController.image.path;
                                            });
                                          },
                                          icon: SvgPicture.asset(
                                            'lib/assets/icons/edit.svg',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: defaultSize,
                        ),
                        TextFieldWidget(
                          width: 335.w,
                          margin: EdgeInsets.only(bottom: 0.h),
                          controller: _profileController.nameController,
                          isLabelled: true,
                          label: 'First Name',
                          hint: 'Zack',
                        ),
                        SizedBox(
                          height: defaultSize,
                        ),
                        Text(
                          'Mobile No.',
                          style: TextStyle(
                              fontSize: ScreenSize.isTabletWidth(context)
                                  ? 10.sp
                                  : 14.sp,
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.w500,
                              color: ColorUtil.lightPrimaryColor),
                        ),
                        SizedBox(height: defaultSize / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            // DropList(
                            //     initialValue: '+91',
                            //     margin: EdgeInsets.symmetric(
                            //         horizontal: 4.w, vertical: 3.h),
                            //     width: ScreenSize.isTabletWidth(context)
                            //         ? 100
                            //         : 79,
                            //     image: 'lib/assets/icons/usa.svg',
                            //     dropList: const ['+91', '+24', '+44']),
                            Container(
                              height: 55,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Text('+${_profileController.countryCode}'),
                            ),
                            SizedBox(width: defaultSize),
                            Expanded(
                              child: TextFieldWidget(
                                keyboard: TextInputType.number,
                                readOnly: true,
                                margin: EdgeInsets.only(bottom: 0.h),
                                controller: _profileController.mobileController,
                                hint: '+1(229) 296-6824',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: defaultSize,
                        ),
                        TextFieldWidget(
                          width: 330.w,
                          margin: EdgeInsets.only(bottom: 0.h),
                          controller: _profileController.emailController,
                          isLabelled: true,
                          label: 'Email Address',
                          hint: 'Zack@fillerup.com',
                        ),
                        SizedBox(
                          height: defaultSize,
                        ),
                        TextFieldWidget(
                          size: 14.sp,
                          margin: EdgeInsets.only(bottom: 16.h),
                          controller: _profileController.passController,
                          isLabelled: true,
                          readOnly: true,
                          label: 'Password',
                          hint: '**********',
                        ),
                        ButtonWidget(
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w600,
                          ),
                          onPressed: () {
                            if (validate()) {
                              _profileController.updateProfile(imagePath);
                            }
                          },
                          text: 'Update Profile',
                        ),
                        SizedBox(
                          height: defaultSize,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool validate() {
    if (_profileController.nameController.text.isEmpty) {
      EasyLoading.showError('Enter full name');
      return false;
    } else if (_profileController.emailController.text.isEmpty) {
      EasyLoading.showError('Enter valid email ID');
      return false;
    } else {
      return true;
    }
  }
}
