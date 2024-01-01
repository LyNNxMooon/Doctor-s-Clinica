// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      id: json['_id'] as String?,
      doctorNRC: json['doctor_nrc'] as String?,
      doctorName: json['doctor_name'] as String?,
      doctorEmail: json['doctor_email'] as String?,
      doctorPhone: json['doctor_phone'] as String?,
      doctorQualification: json['doctor_qualification'] as String?,
      doctorSpecialty: json['doctor_specialty'] as String?,
      assignedClinic: json['assigned_clinic_hospital'] as List<dynamic>?,
      patientList: json['patient_list'] as List<dynamic>?,
      doctorPassword: json['doctor_password'] as String?,
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'doctor_nrc': instance.doctorNRC,
      'doctor_name': instance.doctorName,
      'doctor_email': instance.doctorEmail,
      'doctor_phone': instance.doctorPhone,
      'doctor_qualification': instance.doctorQualification,
      'doctor_specialty': instance.doctorSpecialty,
      'assigned_clinic_hospital': instance.assignedClinic,
      'patient_list': instance.patientList,
      'doctor_password': instance.doctorPassword,
    };
