import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';
import 'package:clinica_doctor/data/model/doctor_info_model.dart';
import 'package:clinica_doctor/data/model/records_by_date_model.dart';
import 'package:clinica_doctor/data/provider_data_model.dart';
import 'package:clinica_doctor/data/vos/single_medical_record_vo.dart';
import 'package:clinica_doctor/pages/home_page.dart';
import 'package:clinica_doctor/pages/medical_record_detail_page.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final RecordsByDateModel recordsByDateModel = RecordsByDateModel();

class CurrentHospitalMedicalRecordPage extends StatefulWidget {
  const CurrentHospitalMedicalRecordPage({super.key});

  @override
  State<CurrentHospitalMedicalRecordPage> createState() =>
      _CurrentHospitalMedicalRecordPageState();
}

class _CurrentHospitalMedicalRecordPageState
    extends State<CurrentHospitalMedicalRecordPage> {
  final DoctorInfoModel _doctorInfoModel = DoctorInfoModel();

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
        builder: (context, value1, child) => SafeArea(
                child: Scaffold(
              backgroundColor: kPrimaryColor,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: kSP25x),
                      child: Text(
                        "Current Hospital",
                        style: TextStyle(
                            fontSize: kFontSize35x,
                            fontWeight: FontWeight.bold,
                            color: kSecondaryColor),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: kSP30x),
                      child: Text(
                        kPatientRecordText,
                        style: TextStyle(
                            fontSize: kFontSize25x, color: kBlackColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kSP5x),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2026))
                                    .then((value) {
                                  _doctorInfoModel.saveDate(
                                      '${value!.year}-${value.month}-${value.day}');

                                  final selectDate = context.read<DataModel>();
                                  selectDate.selectedDate(value);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ));
                                });
                              },
                              icon: const Icon(Icons.date_range)),
                          Text(
                            DateFormat.yMMMd().format(value1.date),
                            style: const TextStyle(
                                fontSize: kFontSize20x,
                                fontWeight: FontWeight.bold,
                                color: kBlackColor),
                          )
                        ],
                      ),
                    ),
                    const MedicalRecordLogSessionView()
                  ],
                ),
              ),
            )));
  }
}

class MedicalRecordLogSessionView extends StatelessWidget {
  const MedicalRecordLogSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recordsByDateModel.getAllMedicalRecordsByDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        var result = snapshot.data?.reversed.toList();

        return Container(
          margin:
              const EdgeInsets.only(top: kSP25x, left: kSP20x, right: kSP20x),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.475,
          child: result!.isEmpty
              ? const Center(child: Text("No Records"))
              : ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedicalRecordDetailPage(
                                  bloodPressure:
                                      result[index].bloodPressure.toString(),
                                  cause: result[index].causeOfIllness,
                                  hospitalName: result[index].hospitalName,
                                  doctorName: result[index].doctorName,
                                  time: result[index].recordCreatedDate,
                                  illness: result[index].illnessName,
                                  medication:
                                      "${result[index].medication[0]} , ${result[index].medication[1] ?? ''}",
                                  recommendation:
                                      result[index].doctorRecommendation,
                                  temp: result[index].bodyTemp.toString(),
                                  heartRate:
                                      result[index].heartRate.toString()),
                            ));
                      },
                      child: MedicalRecordLogItemView(
                          medicalRecordVO: result[index])),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: result.length),
        );
      },
    );
  }
}

class MedicalRecordLogItemView extends StatelessWidget {
  const MedicalRecordLogItemView({
    super.key,
    required this.medicalRecordVO,
  });

  final SingleMedicalRecordVO? medicalRecordVO;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(237, 237, 237, 1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: kSP10x,
                            ),
                            Text(
                              medicalRecordVO!.patientName,
                              style: const TextStyle(
                                  fontSize: kFontSize18x,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              medicalRecordVO!.illnessName,
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
    );
  }
}
