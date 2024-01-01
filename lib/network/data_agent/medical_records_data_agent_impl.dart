import 'package:clinica_doctor/data/model/doctor_info_model.dart';
import 'package:clinica_doctor/data/vos/medical_record_vo.dart';

import 'package:clinica_doctor/network/api/medical_records_api.dart';

import 'package:clinica_doctor/network/data_agent/medical_records_data_agent.dart';
import 'package:clinica_doctor/network/response/patient_profile_response/patient_profile_info_response.dart';
import 'package:dio/dio.dart';

class MedicalRecordDataAgentImpl extends MedicalRecordDataAgent {
  final DoctorInfoModel _doctorInfoModel = DoctorInfoModel();
  late MedicalRecordsAPI _medicalRecordsAPI;
  MedicalRecordDataAgentImpl._() {
    _medicalRecordsAPI = MedicalRecordsAPI(Dio());
  }

  static final MedicalRecordDataAgentImpl _singleton =
      MedicalRecordDataAgentImpl._();

  factory MedicalRecordDataAgentImpl() => _singleton;
  @override
  Future<List<MedicalRecordVO>> getMedicalRecords() => _medicalRecordsAPI
      .getAllPatientInfo('Bearer ${_doctorInfoModel.getDoctorToken}',
          _doctorInfoModel.getPatientID)
      .asStream()
      .map((event) => event.medicalRecord)
      .first;

  @override
  Future<PatientProfileInfoResponse> getPatientDetail() => _medicalRecordsAPI
      .getAllPatientInfo('Bearer ${_doctorInfoModel.getDoctorToken}',
          _doctorInfoModel.getPatientID)
      .asStream()
      .map((event) => event.patientProfile)
      .first;
}
