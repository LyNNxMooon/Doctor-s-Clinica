import 'dart:convert';

import 'package:clinica_doctor/data/model/doctor_info_model.dart';
import 'package:clinica_doctor/network/send_form.dart';
import 'package:clinica_doctor/pages/patient_info_page.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddLogPage extends StatefulWidget {
  const AddLogPage({super.key});

  @override
  State<AddLogPage> createState() => _AddLogPageState();
}

class _AddLogPageState extends State<AddLogPage> {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();
  final TextEditingController _textController4 = TextEditingController();
  final TextEditingController _textController5 = TextEditingController();
  final TextEditingController _textController6 = TextEditingController();
  final TextEditingController _textController7 = TextEditingController();
  final TextEditingController _textController8 = TextEditingController();
  final TextEditingController _textController9 = TextEditingController();

  final DoctorInfoModel _doctorInfoModel = DoctorInfoModel();
  void submit() async {
    try {
      List<String> medicationList = [
        _textController6.text,
        _textController7.text
      ];

      int blood = int.parse(_textController2.text);
      int level = int.parse(_textController4.text);
      int rate = int.parse(_textController3.text);
      int temp = int.parse(_textController1.text);

      SendMedicalForm sendMedicalForm = SendMedicalForm(
        patientID: _doctorInfoModel.getPatientID,
        doctorID: _doctorInfoModel.getDoctorID,
        hospitalID: _doctorInfoModel.getCurrentHospitalID,
        illnessName: _textController5.text,
        causeOfIllness: _textController8.text,
        bloodPressure: blood,
        oxygenLevel: level,
        heartRate: rate,
        bodyTemp: temp,
        doctorRecommendation: _textController9.text,
        medication: medicationList,
      );

      var uri = Uri.https("clinica-app.onrender.com", "medical_records");
      // ignore: unused_local_variable
      var response = await http.post(
        uri,
        body: json.encode(sendMedicalForm.toJson()),
        headers: {
          "Authorization": "Bearer ${_doctorInfoModel.getDoctorToken}",
          "Content-type": "application/json"
        },
      );
    } catch (e) {
      // Handle the error as needed, e.g., show a user-friendly error message.
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const AppBarSectionView(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.medical_information,
                              color: Colors.greenAccent,
                            ),
                            Text(
                              "  General Tested Data",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 20,
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: TextFormField(
                            controller: _textController1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Temperature',
                            ),
                            validator: (value) =>
                                (value != null && value.isEmpty)
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: TextFormField(
                            controller: _textController2,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Blood Pressure',
                            ),
                            validator: (value) =>
                                (value != null && value.isEmpty)
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: TextFormField(
                            controller: _textController3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Heart Rate',
                            ),
                            validator: (value) =>
                                (value != null && value.isEmpty)
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: TextFormField(
                            controller: _textController4,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Oxygen Level',
                            ),
                            validator: (value) =>
                                (value != null && value.isEmpty)
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.event_note_sharp,
                            color: Colors.greenAccent,
                          ),
                          Text(
                            "  Current Sympton",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: TextFormField(
                          controller: _textController5,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Current Illness',
                          ),
                          validator: (value) => (value != null && value.isEmpty)
                              ? 'Required'
                              : null,
                          minLines:
                              4, // Set the minimum number of lines (1 for single line)
                          maxLines: 6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: TextFormField(
                          controller: _textController8,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cause',
                          ),
                          validator: (value) => (value != null && value.isEmpty)
                              ? 'Required'
                              : null,
                          minLines: 5,
                          maxLines: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.medication_liquid,
                            color: Colors.greenAccent,
                          ),
                          Text(
                            "  Medication",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: TextFormField(
                          controller: _textController6,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Medicine',
                          ),
                          validator: (value) => (value != null && value.isEmpty)
                              ? 'Required'
                              : null,
                          minLines: 6,
                          maxLines: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: TextFormField(
                          controller: _textController7,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Extra Medicine',
                          ),
                          minLines: 2,
                          maxLines: 5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: TextFormField(
                          controller: _textController9,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Note',
                          ),
                          validator: (value) => (value != null && value.isEmpty)
                              ? 'Required'
                              : null,
                          minLines: 4,
                          maxLines: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 40,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submit();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PatientInfoPage(),
                            ));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.greenAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Change the border radius
                        ),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ),
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

class AppBarSectionView extends StatefulWidget {
  const AppBarSectionView({super.key});

  @override
  State<AppBarSectionView> createState() => _AppBarSectionViewState();
}

class _AppBarSectionViewState extends State<AppBarSectionView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 150),
              child: Icon(Icons.account_circle_rounded),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PatientInfoPage(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 130),
                child: Icon(Icons.arrow_back),
              ),
            )
          ],
        ),
      ),
    );
  }
}
