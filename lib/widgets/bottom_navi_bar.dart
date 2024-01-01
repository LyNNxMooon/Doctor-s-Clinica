import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNaviBar extends StatelessWidget {
  final Function(int)? onTapChange;

  const BottomNaviBar(this.onTapChange, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP20x),
      child: GNav(
          onTabChange: (value) => onTapChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          color: kBlackColor,
          activeColor: kBlackColor,
          tabActiveBorder: Border.all(color: kBlackColor),
          tabs: const [
            GButton(
              iconColor: kBlackColor,
              textColor: kBlackColor,
              icon: Icons.home,
              text: kBottomNaviItem1,
            ),
            GButton(
              iconColor: kBlackColor,
              textColor: kBlackColor,
              icon: Icons.scanner,
              text: kBottomNaviItem2,
            ),
          ]),
    );
  }
}
