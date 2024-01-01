import 'dart:convert';

import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';
import 'package:clinica_doctor/data/model/doctor_info_model.dart';

import 'package:clinica_doctor/network/response/user_response.dart';
import 'package:clinica_doctor/network/send_info.dart';
import 'package:clinica_doctor/pages/hospital_scanner_page.dart';

import 'package:clinica_doctor/widgets/image_backgorund_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoctorLoginPage extends StatelessWidget {
  const DoctorLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Stack(
              children: [BackgroundView(), Center(child: LoginSessionView())])),
    );
  }
}

class LoginSessionView extends StatefulWidget {
  const LoginSessionView({super.key});

  @override
  State<LoginSessionView> createState() => _LoginSessionViewState();
}

class _LoginSessionViewState extends State<LoginSessionView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final DoctorInfoModel _doctorInfoModel = DoctorInfoModel();

  void send() async {
    SendInfo sendInfo =
        SendInfo(doctorEmail: _email.text, password: _password.text);

    var uri = Uri.https("clinica-app.onrender.com", "doctors-login");
    var response = await http.post(uri,
        body: json.encode(sendInfo.toJson()),
        headers: {"Content-type": "application/json"});

    var user = json.decode(response.body);
    UserResponse userInfo = UserResponse.fromJson(user);

    if (userInfo.token != null) {
      _doctorInfoModel.saveToken(userInfo.token!);
      _doctorInfoModel.saveDoctorID(userInfo.user!.id!);
      _doctorInfoModel.saveDoctorName(userInfo.user!.doctorName!);
      _doctorInfoModel.saveDoctorEmail(userInfo.user!.doctorEmail!);
      _doctorInfoModel.saveDoctorNRC(userInfo.user!.doctorNRC!);
      _doctorInfoModel.saveDoctorSpecialty(userInfo.user!.doctorSpecialty!);
      _doctorInfoModel
          .saveDoctorQualification(userInfo.user!.doctorQualification!);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HospitalScannerPage(),
          ));
    } else if (userInfo.msg != null) {
      setState(() {
        errorText = userInfo.msg;
      });
    }
  }

  String? errorText = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP25x),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '$kLogoNameText $kLoginTitleText',
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: kFontSize40x,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: kSP40x,
            ),
            TextFormField(
              style: const TextStyle(color: kPrimaryColor),
              controller: _email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: kEmailTextFormText,
                  fillColor: kPrimaryColor),
            ),
            const SizedBox(
              height: kSP20x,
            ),
            TextFormField(
              obscureText: true,
              controller: _password,
              style: const TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: kPasswordTextFormText,
                fillColor: kPrimaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kSP10x),
              child: Text(
                errorText!,
                style: const TextStyle(
                    color: kErrorColor, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                send();
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kSecondaryColor)),
              child: const Text(
                kLoginTitleText,
                style: TextStyle(color: kBlackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
