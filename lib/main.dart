import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';
import 'package:clinica_doctor/data/model/doctor_info_model.dart';

import 'package:clinica_doctor/data/provider_data_model.dart';

import 'package:clinica_doctor/pages/hospital_scanner_page.dart';

import 'package:clinica_doctor/pages/login_page.dart';
import 'package:clinica_doctor/persistent/dao/pref_instance.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await PrefInstance.createSharedPreferencesInstance();
  final DoctorInfoModel doctorInfoModel = DoctorInfoModel();
  doctorInfoModel.saveDate(
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');
  runApp(ChangeNotifierProvider(
    create: (context) => DataModel(),
    child: MyApp(
      isToken: doctorInfoModel.isToken,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isToken});

  final bool isToken;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 2500,
            splash: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  kLogoNameText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kFontSize45x,
                      color: kPrimaryColor,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  width: kSP5x,
                ),
                Text(
                  kSplashScreenText,
                  style: TextStyle(fontSize: kFontSize40x, color: kBlackColor),
                )
              ],
            ),
            // ignore: unrelated_type_equality_checks
            nextScreen:
                isToken ? const HospitalScannerPage() : const DoctorLoginPage(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: kSecondaryColor));
  }
}
