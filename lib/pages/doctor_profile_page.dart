import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';
import 'package:clinica_doctor/data/model/doctor_info_model.dart';

import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondaryColor,
        foregroundColor: kBlackColor,
        actions: const [],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(kSP50x),
                    bottomRight: Radius.circular(kSP50x))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: kSP20x),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    kLogoNameText,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kFontSize45x,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Doctor Profile",
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: kFontSize25x,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProfileInfoSessionView()
        ],
      ),
    ));
  }
}

class ProfileInfoSessionView extends StatelessWidget {
  ProfileInfoSessionView({super.key});

  final DoctorInfoModel _doctorInfoModel = DoctorInfoModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.width * 1.4,
      padding: const EdgeInsets.only(left: kSP30x, top: 80, right: kSP30x),
      child: ListView.separated(
          itemBuilder: (context, index) => index == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Name",
                      style: TextStyle(
                          color: kBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: kFontSize18x),
                    ),
                    const SizedBox(
                      width: kSP10x,
                    ),
                    Text(
                      _doctorInfoModel.getDoctorName,
                      style: const TextStyle(fontSize: kFontSize18x),
                    )
                  ],
                )
              : index == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: kFontSize18x),
                        ),
                        const SizedBox(
                          width: kSP10x,
                        ),
                        Text(
                          _doctorInfoModel.getEmail,
                          style: const TextStyle(fontSize: kFontSize18x),
                        )
                      ],
                    )
                  : index == 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "ID",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: kFontSize18x),
                            ),
                            const SizedBox(
                              width: kSP10x,
                            ),
                            Text(
                              _doctorInfoModel.getDoctorID,
                              style: const TextStyle(fontSize: kFontSize18x),
                            )
                          ],
                        )
                      : index == 3
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Specialty",
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: kFontSize18x),
                                ),
                                const SizedBox(
                                  width: kSP10x,
                                ),
                                Text(
                                  _doctorInfoModel.getSpecialty,
                                  style:
                                      const TextStyle(fontSize: kFontSize18x),
                                )
                              ],
                            )
                          : index == 4
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Qualification",
                                      style: TextStyle(
                                          color: kBlackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: kFontSize18x),
                                    ),
                                    const SizedBox(
                                      width: kSP10x,
                                    ),
                                    Text(
                                      _doctorInfoModel.getQualification,
                                      style: const TextStyle(
                                          fontSize: kFontSize18x),
                                    )
                                  ],
                                )
                              : const SizedBox(),
          separatorBuilder: (context, index) => const Divider(
                thickness: 3,
                height: kSP70x,
              ),
          itemCount: 5),
    );
  }
}
