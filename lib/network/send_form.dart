import 'package:json_annotation/json_annotation.dart';
part 'send_form.g.dart';

@JsonSerializable()
class SendMedicalForm {
  @JsonKey(name: 'patient_id')
  final String patientID;
  @JsonKey(name: 'doctor_id')
  final String doctorID;
  @JsonKey(name: 'hospital_clinic_id')
  final String hospitalID;
  @JsonKey(name: 'illeness_name')
  final String illnessName;
  @JsonKey(name: 'cause_of_illeness')
  final String causeOfIllness;
  @JsonKey(name: 'patient_blood_pressure')
  final int bloodPressure;
  @JsonKey(name: 'patient_oxygen_level')
  final int oxygenLevel;
  @JsonKey(name: 'patient_heart_rate')
  final int heartRate;
  @JsonKey(name: 'patient_body_temperature')
  final int bodyTemp;
  @JsonKey(name: 'doctor_recommendation')
  final String doctorRecommendation;
  @JsonKey(name: 'doctor_medication_list')
  final List medication;

  SendMedicalForm(
      {required this.patientID,
      required this.doctorID,
      required this.hospitalID,
      required this.illnessName,
      required this.causeOfIllness,
      required this.bloodPressure,
      required this.oxygenLevel,
      required this.heartRate,
      required this.bodyTemp,
      required this.doctorRecommendation,
      required this.medication});

  Map<String, dynamic> toJson() => _$SendMedicalFormToJson(this);
}
