import 'package:clinica_doctor/data/vos/single_medical_record_vo.dart';
import 'package:clinica_doctor/network/data_agent/records_by_date_data_agent.dart';
import 'package:clinica_doctor/network/data_agent/records_by_date_data_agent_impl.dart';

class RecordsByDateModel {
  RecordsByDateModel._();
  static final RecordsByDateModel _singleton = RecordsByDateModel._();
  factory RecordsByDateModel() => _singleton;
  final RecordsByDateDateAgent _recordsByDateDateAgent =
      RecordsByDateDataAgentImpl();

  Future<List<SingleMedicalRecordVO>> getAllMedicalRecordsByDate() =>
      _recordsByDateDateAgent.getRecordsByDate();
}
