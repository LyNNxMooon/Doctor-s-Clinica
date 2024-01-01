import 'package:clinica_doctor/data/vos/medical_record_vo.dart';
import 'package:clinica_doctor/network/response/patient_profile_response/patient_profile_info_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'patient_profile_response.g.dart';

@JsonSerializable()
class PatientProfileResponse {
  @JsonKey(name: 'patient_profile')
  final PatientProfileInfoResponse patientProfile;
  @JsonKey(name: 'patient_medical_records')
  final List<MedicalRecordVO> medicalRecord;

  PatientProfileResponse(
      {required this.patientProfile, required this.medicalRecord});

  factory PatientProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientProfileResponseFromJson(json);
}
