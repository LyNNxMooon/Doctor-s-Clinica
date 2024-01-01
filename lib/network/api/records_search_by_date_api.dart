import 'package:clinica_doctor/data/vos/single_medical_record_vo.dart';
import 'package:clinica_doctor/network/api_constant/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'records_search_by_date_api.g.dart';

@RestApi(baseUrl: kBaseURLForClinica)
abstract class MedicalRecordsByDateAPI {
  factory MedicalRecordsByDateAPI(Dio dio) => _MedicalRecordsByDateAPI(dio);
  @GET(kEndPointForMedicalRecordsSearchedByDate)
  @FormUrlEncoded()
  Future<List<SingleMedicalRecordVO>> getAllRecords(
      @Header(kAuthKey) String authorization,
      @Field(kBodyKeyForDate) String date,
      @Field(kBodyKeyForDoctor) String doctorId,
      @Field(kBodyKeyForHospital) String hospitalId);
}
