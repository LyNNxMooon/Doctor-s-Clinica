import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';
import 'package:clinica_doctor/data/model/doctor_info_model.dart';
import 'package:clinica_doctor/pages/patient_info_page.dart';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class PatientQRScanner extends StatefulWidget {
  const PatientQRScanner({super.key});

  @override
  State<PatientQRScanner> createState() => _PatientQRScannerState();
}

class _PatientQRScannerState extends State<PatientQRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result = '';
  final DoctorInfoModel _doctorInfoModel = DoctorInfoModel();

  _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!;
      });
      _doctorInfoModel.savePatientID(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  cutOutSize: MediaQuery.of(context).size.width * 0.8,
                  borderRadius: kSP10x,
                  borderLength: kSP20x,
                  borderWidth: kSP10x,
                  borderColor: kSecondaryColor),
            )),
        Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "$kScannerText $result",
                style: const TextStyle(
                    fontSize: kFontSize18x, color: kPrimaryColor),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: kSP20x),
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kSecondaryColor)),
              onPressed: () {
                if (result.isNotEmpty && _doctorInfoModel.isPatientID) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientInfoPage(),
                      ));
                }
              },
              child: const Text(
                kScannerOpenText,
                style: TextStyle(color: kBlackColor),
              )),
        ),
      ],
    );
  }
}
