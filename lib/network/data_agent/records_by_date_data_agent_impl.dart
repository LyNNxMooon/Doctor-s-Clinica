import 'package:clinica_doctor/data/model/doctor_info_model.dart';
import 'package:clinica_doctor/data/vos/single_medical_record_vo.dart';
import 'package:clinica_doctor/network/api/records_search_by_date_api.dart';
import 'package:clinica_doctor/network/data_agent/records_by_date_data_agent.dart';
import 'package:dio/dio.dart';

class RecordsByDateDataAgentImpl extends RecordsByDateDateAgent {
  final DoctorInfoModel _doctorInfoModel = DoctorInfoModel();
  late MedicalRecordsByDateAPI _medicalRecordsByDateAPI;
  RecordsByDateDataAgentImpl._() {
    _medicalRecordsByDateAPI = MedicalRecordsByDateAPI(Dio());
  }

  static final RecordsByDateDataAgentImpl _singleton =
      RecordsByDateDataAgentImpl._();
  factory RecordsByDateDataAgentImpl() => _singleton;
  @override
  Future<List<SingleMedicalRecordVO>>
      getRecordsByDate() => _medicalRecordsByDateAPI
          .getAllRecords(
              'Bearer ${_doctorInfoModel.getDoctorToken}',
              _doctorInfoModel.getDate,
              _doctorInfoModel.getDoctorID,
              _doctorInfoModel.getCurrentHospitalID)
          .asStream()
          .map((event) => event)
          .first;
}
