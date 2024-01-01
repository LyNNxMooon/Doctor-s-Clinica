import 'package:clinica_doctor/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:clinica_doctor/constants/dimensions.dart';

class MedicalRecordDetailPage extends StatelessWidget {
  const MedicalRecordDetailPage({
    super.key,
    required this.hospitalName,
    required this.doctorName,
    required this.time,
    required this.illness,
    required this.medication,
    required this.recommendation,
    required this.temp,
    required this.heartRate,
    required this.cause,
    required this.bloodPressure,
  });

  final String hospitalName;
  final String doctorName;
  final String time;
  final String illness;
  final String cause;
  final String medication;
  final String recommendation;
  final String temp;
  final String heartRate;
  final String bloodPressure;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title: Text(
            hospitalName,
            style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: kFontSize30x,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          actions: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: kBlackColor,
                )),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.85,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Visited Doctor',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  width: 335,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: kBlackColor, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              time,
                              style: const TextStyle(
                                fontSize: 18.5,
                              ),
                            )),
                      ),
                      const Divider(
                        height: 2,
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dr. $doctorName",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Medication',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: kSP20x),
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: kBlackColor, width: 1),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Text(
                              'Sympton:',
                              style: TextStyle(
                                  fontSize: kFontSize18x,
                                  fontWeight: FontWeight.bold),
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              illness,
                              style: const TextStyle(fontSize: kFontSize18x),
                            )),
                        const Divider(
                          height: 30,
                          indent: 15,
                          endIndent: 15,
                          thickness: 2,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Text(
                              'Cause:',
                              style: TextStyle(
                                  fontSize: kFontSize18x,
                                  fontWeight: FontWeight.bold),
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              cause,
                              style: const TextStyle(fontSize: kFontSize18x),
                            )),
                        const Divider(
                          height: 30,
                          indent: 15,
                          endIndent: 15,
                          thickness: 2,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Text(
                              'Medicine:',
                              style: TextStyle(
                                  fontSize: kFontSize18x,
                                  fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            medication,
                            style: const TextStyle(fontSize: kFontSize18x),
                          ),
                        ),
                        const Divider(
                          height: 30,
                          indent: 15,
                          endIndent: 15,
                          thickness: 2,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Text(
                              'Recommendation:',
                              style: TextStyle(
                                  fontSize: kFontSize18x,
                                  fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            textAlign: TextAlign.start,
                            recommendation,
                            style: const TextStyle(fontSize: kFontSize18x),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Physical Records',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  width: 335,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: kBlackColor, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Temperature : $temp",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 2,
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Blood Pressure : $bloodPressure",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 2,
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Heart Rate : $heartRate",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 2,
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Oxygen Level : 98",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
