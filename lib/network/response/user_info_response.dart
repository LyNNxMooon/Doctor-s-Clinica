import 'package:json_annotation/json_annotation.dart';
part 'user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "doctor_nrc")
  final String? doctorNRC;
  @JsonKey(name: "doctor_name")
  final String? doctorName;
  @JsonKey(name: "doctor_email")
  final String? doctorEmail;
  @JsonKey(name: "doctor_phone")
  final String? doctorPhone;
  @JsonKey(name: "doctor_qualification")
  final String? doctorQualification;
  @JsonKey(name: "doctor_specialty")
  final String? doctorSpecialty;
  @JsonKey(name: "assigned_clinic_hospital")
  final List? assignedClinic;
  @JsonKey(name: "patient_list")
  final List? patientList;
  @JsonKey(name: "doctor_password")
  final String? doctorPassword;

  UserInfoResponse(
      {required this.id,
      required this.doctorNRC,
      required this.doctorName,
      required this.doctorEmail,
      required this.doctorPhone,
      required this.doctorQualification,
      required this.doctorSpecialty,
      required this.assignedClinic,
      required this.patientList,
      required this.doctorPassword});

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
}
