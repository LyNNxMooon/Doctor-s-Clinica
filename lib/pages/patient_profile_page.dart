import 'package:clinica_doctor/constants/colors.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:clinica_doctor/constants/strings.dart';
import 'package:flutter/material.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage(
      {super.key,
      required this.name,
      required this.age,
      required this.weight,
      required this.history,
      required this.medicine});
  final String name;
  final int age;
  final String weight;
  final String history;
  final String medicine;

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
                    "Patient Profile",
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: kFontSize25x,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProfileInfoSessionView(
            age: age,
            name: name,
            history: history,
            weight: weight,
            medicine: medicine,
          )
        ],
      ),
    ));
  }
}

class ProfileInfoSessionView extends StatelessWidget {
  const ProfileInfoSessionView(
      {super.key,
      required this.name,
      required this.age,
      required this.weight,
      required this.history,
      required this.medicine});
  final String name;
  final int age;
  final String weight;
  final String history;
  final String medicine;

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
                      name,
                      style: const TextStyle(fontSize: kFontSize18x),
                    )
                  ],
                )
              : index == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: kFontSize18x),
                        ),
                        const SizedBox(
                          width: kSP10x,
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(fontSize: kFontSize18x),
                        )
                      ],
                    )
                  : index == 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Weight",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: kFontSize18x),
                            ),
                            const SizedBox(
                              width: kSP10x,
                            ),
                            Text(
                              weight,
                              style: const TextStyle(fontSize: kFontSize18x),
                            )
                          ],
                        )
                      : index == 3
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Allergic History",
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSize18x),
                                  ),
                                  const SizedBox(
                                    width: kSP10x,
                                  ),
                                  Text(
                                    history,
                                    style:
                                        const TextStyle(fontSize: kFontSize18x),
                                  )
                                ],
                              ),
                            )
                          : index == 4
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Allergic Medicine",
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: kFontSize18x),
                                      ),
                                      const SizedBox(
                                        width: kSP10x,
                                      ),
                                      Text(
                                        medicine,
                                        style: const TextStyle(
                                            fontSize: kFontSize18x),
                                      )
                                    ],
                                  ),
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
