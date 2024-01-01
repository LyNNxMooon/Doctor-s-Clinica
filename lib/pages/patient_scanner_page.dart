import 'package:clinica_doctor/constants/colors.dart';

import 'package:clinica_doctor/constants/strings.dart';
import 'package:clinica_doctor/widgets/image_backgorund_view.dart';
import 'package:clinica_doctor/widgets/patient_qr_scanner_session.dart';

import 'package:flutter/material.dart';

class PatientScannerPage extends StatelessWidget {
  const PatientScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          kPatientScannerPageTitle,
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: const Stack(children: [BackgroundView(), PatientQRScanner()]),
    );
  }
}
