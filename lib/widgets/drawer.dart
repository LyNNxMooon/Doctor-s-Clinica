import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';
import 'package:clinica_doctor/data/model/doctor_info_model.dart';
import 'package:clinica_doctor/pages/doctor_profile_page.dart';

import 'package:clinica_doctor/pages/login_page.dart';

import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  DrawerView({super.key});

  final DoctorInfoModel _doctorInfoModel = DoctorInfoModel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      const DrawerHeader(
        decoration: BoxDecoration(color: kSecondaryColor),
        child: Text(
          kLogoNameText,
          style: TextStyle(fontSize: kFontSize30x, fontWeight: FontWeight.bold),
        ),
      ),
      ListTile(
          title: const Text(
            kProfileText,
            style:
                TextStyle(fontSize: kFontSize18x, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorProfilePage(),
                ));
          }),
      ListTile(
          title: const Text(
            'Logout',
            style:
                TextStyle(fontSize: kFontSize18x, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            _doctorInfoModel.removeToken();
            _doctorInfoModel.removeDoctorName();
            _doctorInfoModel.removeDoctorID();
            _doctorInfoModel.removeDoctorEmail();
            _doctorInfoModel.removeDoctorNRC();
            _doctorInfoModel.removeDoctorSpecialty();
            _doctorInfoModel.removeDoctorQualification();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorLoginPage(),
                ));
          })
    ]));
  }
}
