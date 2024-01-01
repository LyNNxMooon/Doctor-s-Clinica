import 'package:json_annotation/json_annotation.dart';
part 'medical_record_vo.g.dart';

@JsonSerializable()
class MedicalRecordVO {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'record_created_date')
  final String recordCreatedDate;
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

  @JsonKey(name: 'doctor_name')
  final String doctorName;
  @JsonKey(name: 'hospital_clinic_name')
  final String hospitalName;

  MedicalRecordVO(
      {required this.id,
      required this.recordCreatedDate,
      required this.patientID,
      required this.doctorID,
      required this.hospitalID,
      required this.illnessName,
      required this.causeOfIllness,
      required this.bloodPressure,
      required this.oxygenLevel,
      required this.heartRate,
      required this.bodyTemp,
      required this.doctorRecommendation,
      required this.medication,
      required this.doctorName,
      required this.hospitalName});

  factory MedicalRecordVO.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordVOFromJson(json);
}
