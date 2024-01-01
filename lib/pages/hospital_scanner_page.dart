import 'package:clinica_doctor/constants/colors.dart';

import 'package:clinica_doctor/constants/strings.dart';
import 'package:clinica_doctor/widgets/image_backgorund_view.dart';
import 'package:clinica_doctor/widgets/qr_scanner_session.dart';
import 'package:flutter/material.dart';

class HospitalScannerPage extends StatelessWidget {
  const HospitalScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          kHospitalScannerPageTitle,
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: const Stack(children: [BackgroundView(), QRScanner()]),
    ));
  }
}
