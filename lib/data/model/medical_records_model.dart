import 'package:clinica_doctor/data/vos/medical_record_vo.dart';

import 'package:clinica_doctor/network/data_agent/medical_records_data_agent.dart';
import 'package:clinica_doctor/network/data_agent/medical_records_data_agent_impl.dart';

import 'package:clinica_doctor/network/response/patient_profile_response/patient_profile_info_response.dart';

class MedicalRecordModel {
  MedicalRecordModel._();
  static final MedicalRecordModel _singleton = MedicalRecordModel._();

  factory MedicalRecordModel() => _singleton;

  final MedicalRecordDataAgent _medicalRecordDataAgent =
      MedicalRecordDataAgentImpl();

  Future<List<MedicalRecordVO>> getAllRecords() =>
      _medicalRecordDataAgent.getMedicalRecords();

  Future<PatientProfileInfoResponse> getPatientInfo() =>
      _medicalRecordDataAgent.getPatientDetail();
}
