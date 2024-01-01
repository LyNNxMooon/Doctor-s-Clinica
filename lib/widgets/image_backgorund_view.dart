import 'package:clinica_doctor/constants/assets_images.dart';
import 'package:clinica_doctor/constants/dimensions.dart';
import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      child: Opacity(
        opacity: kOpacity,
        child: Image.asset(
          kScannerPageBackground,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
