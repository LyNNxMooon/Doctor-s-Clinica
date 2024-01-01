import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';

import 'package:clinica_doctor/data/model/medical_records_model.dart';

import 'package:clinica_doctor/data/provider_data_model.dart';
import 'package:clinica_doctor/data/vos/medical_record_vo.dart';
import 'package:clinica_doctor/network/response/patient_profile_response/patient_profile_info_response.dart';
import 'package:clinica_doctor/pages/add_log_page.dart';
import 'package:clinica_doctor/pages/medical_record_detail_page.dart';
import 'package:clinica_doctor/pages/patient_profile_page.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

final MedicalRecordModel medicalRecordModel = MedicalRecordModel();

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
            body: FutureBuilder<List<MedicalRecordVO>>(
          future: medicalRecordModel.getAllRecords(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            final result = snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSP20x, vertical: kSP20x),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      kPatientInfoText,
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: kFontSize25x,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const PatientProfileInfoSession(),
                    const Text(
                      kVisitedLogText,
                      style: TextStyle(
                          color: kBlackColor,
                          fontSize: kFontSize25x,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            MedicalRecordLogItemView(
                                medicalRecord: result?[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: kSP10x,
                        ),
                        itemCount: result?.length ?? 0,
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddLogPage(),
                              ));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(kSecondaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(kSP20x),
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: const Text(
                            textAlign: TextAlign.center,
                            kAddButtonText,
                            style: TextStyle(color: kBlackColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}

class PatientProfileInfoSession extends StatelessWidget {
  const PatientProfileInfoSession({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: medicalRecordModel.getPatientInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }
        var result = snapshot.data;
        return Container(
          padding: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * 1,
          height: 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(kSP20x)),
              color: kGreyColor),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: PatientProfileInfoItemsView(
              patientProfileInfo: result,
            ),
          ),
        );
      },
    );
  }
}

class PatientProfileInfoItemsView extends StatelessWidget {
  const PatientProfileInfoItemsView({
    super.key,
    required this.patientProfileInfo,
  });

  final PatientProfileInfoResponse? patientProfileInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP25x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Text(
                kPatientNameText,
                style: TextStyle(
                    fontSize: kFontSize18x, fontWeight: FontWeight.bold),
              ),
              Text(
                patientProfileInfo!.patientName,
                style: const TextStyle(fontSize: kFontSize18x),
              ),
            ],
          ),
          const SizedBox(
            height: kSP10x,
          ),
          Row(
            children: [
              const Text(
                kPatientAgeText,
                style: TextStyle(
                  fontSize: kFontSize18x,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                (patientProfileInfo!.patientAge).toString(),
                style: const TextStyle(fontSize: kFontSize18x),
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientProfilePage(
                          name: patientProfileInfo?.patientName ?? '',
                          age: patientProfileInfo?.patientAge ?? 0,
                          weight: patientProfileInfo?.patientWeight ?? '',
                          history: patientProfileInfo?.allergicHistory[0] ?? '',
                          medicine:
                              patientProfileInfo?.medicalHistory[0] ?? ''),
                    ));
              },
              child: const Text(kViewDetailText))
        ],
      ),
    );
  }
}

class MedicalRecordLogItemView extends StatelessWidget {
  const MedicalRecordLogItemView({
    super.key,
    required this.medicalRecord,
  });

  final MedicalRecordVO? medicalRecord;
  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, value, child) => GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicalRecordDetailPage(
                  bloodPressure: medicalRecord!.bloodPressure.toString(),
                  cause: medicalRecord!.causeOfIllness,
                  hospitalName: medicalRecord!.hospitalName,
                  doctorName: medicalRecord!.doctorName,
                  illness: medicalRecord!.illnessName,
                  recommendation: medicalRecord!.doctorRecommendation,
                  medication:
                      "${medicalRecord!.medication[0]} , ${medicalRecord?.medication[1] ?? ''}",
                  temp: medicalRecord!.bodyTemp.toString(),
                  heartRate: medicalRecord!.heartRate.toString(),
                  time: medicalRecord!.recordCreatedDate),
            )),
        child: Container(
          decoration: const BoxDecoration(
            color: kGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(kSP20x)),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSP25x, vertical: kSP20x),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: kPatientMedicalRecordLogItemHeight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                medicalRecord?.illnessName ?? '',
                                style: const TextStyle(
                                    fontSize: kFontSize25x,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: kSP10x,
                              ),
                              Text(
                                medicalRecord?.doctorName ?? '',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                height: kSP10x,
                              ),
                              Text(
                                medicalRecord?.hospitalName ?? '',
                                style: const TextStyle(
                                    fontSize: kFontSize18x,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
      ),
    );
  }
}
