// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordVO _$MedicalRecordVOFromJson(Map<String, dynamic> json) =>
    MedicalRecordVO(
      id: json['_id'] as String,
      recordCreatedDate: json['record_created_date'] as String,
      patientID: json['patient_id'] as String,
      doctorID: json['doctor_id'] as String,
      hospitalID: json['hospital_clinic_id'] as String,
      illnessName: json['illeness_name'] as String,
      causeOfIllness: json['cause_of_illeness'] as String,
      bloodPressure: json['patient_blood_pressure'] as int,
      oxygenLevel: json['patient_oxygen_level'] as int,
      heartRate: json['patient_heart_rate'] as int,
      bodyTemp: json['patient_body_temperature'] as int,
      doctorRecommendation: json['doctor_recommendation'] as String,
      medication: json['doctor_medication_list'] as List<dynamic>,
      doctorName: json['doctor_name'] as String,
      hospitalName: json['hospital_clinic_name'] as String,
    );

Map<String, dynamic> _$MedicalRecordVOToJson(MedicalRecordVO instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'record_created_date': instance.recordCreatedDate,
      'patient_id': instance.patientID,
      'doctor_id': instance.doctorID,
      'hospital_clinic_id': instance.hospitalID,
      'illeness_name': instance.illnessName,
      'cause_of_illeness': instance.causeOfIllness,
      'patient_blood_pressure': instance.bloodPressure,
      'patient_oxygen_level': instance.oxygenLevel,
      'patient_heart_rate': instance.heartRate,
      'patient_body_temperature': instance.bodyTemp,
      'doctor_recommendation': instance.doctorRecommendation,
      'doctor_medication_list': instance.medication,
      'doctor_name': instance.doctorName,
      'hospital_clinic_name': instance.hospitalName,
    };
