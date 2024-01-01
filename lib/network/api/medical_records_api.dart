import 'package:clinica_doctor/network/api_constant/api_constant.dart';
import 'package:clinica_doctor/network/response/patient_profile_response/patient_profile_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'medical_records_api.g.dart';

@RestApi(baseUrl: kBaseURLForClinica)
abstract class MedicalRecordsAPI {
  factory MedicalRecordsAPI(Dio dio) => _MedicalRecordsAPI(dio);
  @GET(kEndPointForPatientMedicalRecord)
  @FormUrlEncoded()
  Future<PatientProfileResponse> getAllPatientInfo(
      @Header(kAuthKey) String authorization,
      @Field(kBodyKeyForMedicalRecords) String doctorToken);
}
