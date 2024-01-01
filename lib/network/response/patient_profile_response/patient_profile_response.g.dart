// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientProfileResponse _$PatientProfileResponseFromJson(
        Map<String, dynamic> json) =>
    PatientProfileResponse(
      patientProfile: PatientProfileInfoResponse.fromJson(
          json['patient_profile'] as Map<String, dynamic>),
      medicalRecord: (json['patient_medical_records'] as List<dynamic>)
          .map((e) => MedicalRecordVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientProfileResponseToJson(
        PatientProfileResponse instance) =>
    <String, dynamic>{
      'patient_profile': instance.patientProfile,
      'patient_medical_records': instance.medicalRecord,
    };
