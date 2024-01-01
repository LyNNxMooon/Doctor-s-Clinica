import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/pages/hospital_scanner_page.dart';
import 'package:clinica_doctor/pages/medical_record.dart';
import 'package:clinica_doctor/pages/patient_scanner_page.dart';
import 'package:clinica_doctor/widgets/bottom_navi_bar.dart';
import 'package:clinica_doctor/widgets/drawer.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const [
    CurrentHospitalMedicalRecordPage(),
    PatientScannerPage()
  ];

  int selectedIndex = 0;
  navigateBottomBar(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: kBlackColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HospitalScannerPage(),
                    ));
              },
              icon: const Icon(Icons.qr_code_scanner))
        ],
      ),
      drawer: DrawerView(),
      bottomNavigationBar: BottomNaviBar((index) {
        navigateBottomBar(index);
      }),
      body: pages[selectedIndex],
    ));
  }
}
