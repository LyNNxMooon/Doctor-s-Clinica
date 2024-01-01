import 'package:clinica_doctor/persistent/dao/pref_instance.dart';
import 'package:clinica_doctor/persistent/preferences_key_constant.dart';

class DoctorInfoDAO {
  DoctorInfoDAO._();

  static final DoctorInfoDAO _singleton = DoctorInfoDAO._();

  factory DoctorInfoDAO() => _singleton;

  //save data
  void saveToken(String token) {
    PrefInstance.getSharedPreferences.setString(kTokenKey, token);
  }

  void saveDoctorName(String name) {
    PrefInstance.getSharedPreferences.setString(kDoctorNameKey, name);
  }

  void saveDoctorEmail(String email) {
    PrefInstance.getSharedPreferences.setString(kDoctorEmailKey, email);
  }

  void saveDoctorID(String id) {
    PrefInstance.getSharedPreferences.setString(kDoctorIDKey, id);
  }

  void saveDoctorNRC(String nrc) {
    PrefInstance.getSharedPreferences.setString(kDoctorNRCKey, nrc);
  }

  void saveDoctorSpecialty(String specialty) {
    PrefInstance.getSharedPreferences.setString(kDoctorSpecialtyKey, specialty);
  }

  void saveDoctorQualification(String qualification) {
    PrefInstance.getSharedPreferences
        .setString(kDoctorQualificationKey, qualification);
  }

  void savePatientID(String id) {
    PrefInstance.getSharedPreferences.setString(kPatientIdKey, id);
  }

  void saveCurrentHospitalID(String id) {
    PrefInstance.getSharedPreferences.setString(kCurrentHospitalID, id);
  }

  void savePhone(String phone) {
    PrefInstance.getSharedPreferences.setString(kDoctorPhoneKey, phone);
  }

  void saveDate(String date) {
    PrefInstance.getSharedPreferences.setString(kDateKey, date);
  }

  void saveHospitalName(String name) {
    PrefInstance.getSharedPreferences.setString(kHospitalNameKey, name);
  }

  //check token
  bool get getToken => PrefInstance.getSharedPreferences.containsKey(kTokenKey);
  bool get isPatientID =>
      PrefInstance.getSharedPreferences.containsKey(kPatientIdKey);
  bool get isHospitalId =>
      PrefInstance.getSharedPreferences.containsKey(kCurrentHospitalID);

  //get data
  String? get getDoctorName =>
      PrefInstance.getSharedPreferences.getString(kDoctorNameKey);

  String? get getDoctorToken =>
      PrefInstance.getSharedPreferences.getString(kTokenKey);

  String? get getPatientID =>
      PrefInstance.getSharedPreferences.getString(kPatientIdKey);

  String? get getCurrentHospitalID =>
      PrefInstance.getSharedPreferences.getString(kCurrentHospitalID);

  String? get getDoctorID =>
      PrefInstance.getSharedPreferences.getString(kDoctorIDKey);

  String? get getEmail =>
      PrefInstance.getSharedPreferences.getString(kDoctorEmailKey);
  String? get getPhone =>
      PrefInstance.getSharedPreferences.getString(kDoctorPhoneKey);
  String? get getQualification =>
      PrefInstance.getSharedPreferences.getString(kDoctorQualificationKey);

  String? get getSpecialty =>
      PrefInstance.getSharedPreferences.getString(kDoctorSpecialtyKey);

  String? get getDate => PrefInstance.getSharedPreferences.getString(kDateKey);
  String? get getHospitalName =>
      PrefInstance.getSharedPreferences.getString(kHospitalNameKey);

  //remove data

  void removeToken() {
    PrefInstance.getSharedPreferences.remove(kTokenKey);
  }

  void removeID() {
    PrefInstance.getSharedPreferences.remove(kDoctorIDKey);
  }

  void removeName() {
    PrefInstance.getSharedPreferences.remove(kDoctorNameKey);
  }

  void removeEmail() {
    PrefInstance.getSharedPreferences.remove(kDoctorEmailKey);
  }

  void removeNRC() {
    PrefInstance.getSharedPreferences.remove(kDoctorNRCKey);
  }

  void removeSpecialty() {
    PrefInstance.getSharedPreferences.remove(kDoctorSpecialtyKey);
  }

  void removeQualification() {
    PrefInstance.getSharedPreferences.remove(kDoctorQualificationKey);
  }

  void removePatientID() {
    PrefInstance.getSharedPreferences.remove(kPatientIdKey);
  }
}
