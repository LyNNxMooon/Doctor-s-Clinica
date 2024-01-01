// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_profile_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientProfileInfoResponse _$PatientProfileInfoResponseFromJson(
        Map<String, dynamic> json) =>
    PatientProfileInfoResponse(
      id: json['_id'] as String,
      createdDate: json['created_date'] as String,
      patientNrc: json['patient_nrc'] as String,
      patientName: json['patient_name'] as String,
      patientEmail: json['patient_email'] as String,
      patientPhone: json['patient_phone'] as String,
      patientDob: json['patient_dob'] as String,
      patientAge: json['patient_age'] as int,
      patientSex: json['patient_sex'] as String,
      patientHeight: json['patient_height'] as String,
      patientWeight: json['patient_weight'] as String,
      patientAddress: json['patient_address'] as String,
      allergicHistory: json['allergic_history'] as List<dynamic>,
      medicalHistory: json['medical_history'] as List<dynamic>,
      visitedDoctorList: json['visited_doctor_list'] as List<dynamic>,
      visitedHospitalClinicList:
          json['visited_hospital_clinic_list'] as List<dynamic>,
      patientPassword: json['patient_password'] as String,
      patientMedicalRecord: json['patient_medical_records'] as List<dynamic>,
    );

Map<String, dynamic> _$PatientProfileInfoResponseToJson(
        PatientProfileInfoResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'created_date': instance.createdDate,
      'patient_nrc': instance.patientNrc,
      'patient_name': instance.patientName,
      'patient_email': instance.patientEmail,
      'patient_phone': instance.patientPhone,
      'patient_dob': instance.patientDob,
      'patient_age': instance.patientAge,
      'patient_sex': instance.patientSex,
      'patient_height': instance.patientHeight,
      'patient_weight': instance.patientWeight,
      'patient_address': instance.patientAddress,
      'allergic_history': instance.allergicHistory,
      'medical_history': instance.medicalHistory,
      'visited_doctor_list': instance.visitedDoctorList,
      'visited_hospital_clinic_list': instance.visitedHospitalClinicList,
      'patient_password': instance.patientPassword,
      'patient_medical_records': instance.patientMedicalRecord,
    };
