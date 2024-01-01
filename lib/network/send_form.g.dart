// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMedicalForm _$SendMedicalFormFromJson(Map<String, dynamic> json) =>
    SendMedicalForm(
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
    );

Map<String, dynamic> _$SendMedicalFormToJson(SendMedicalForm instance) =>
    <String, dynamic>{
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
    };
