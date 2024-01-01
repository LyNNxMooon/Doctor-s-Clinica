import 'package:clinica_doctor/persistent/dao/user_dao.dart';

class DoctorInfoModel {
  DoctorInfoModel._();
  static final DoctorInfoModel _singleton = DoctorInfoModel._();
  factory DoctorInfoModel() => _singleton;

  final DoctorInfoDAO _doctorInfoDAO = DoctorInfoDAO();

  //save doctor data
  void saveToken(String token) {
    _doctorInfoDAO.saveToken(token);
  }

  void saveDoctorID(String id) {
    _doctorInfoDAO.saveDoctorID(id);
  }

  void saveDoctorName(String name) {
    _doctorInfoDAO.saveDoctorName(name);
  }

  void saveDoctorEmail(String email) {
    _doctorInfoDAO.saveDoctorEmail(email);
  }

  void saveDoctorNRC(String nrc) {
    _doctorInfoDAO.saveDoctorNRC(nrc);
  }

  void saveDoctorSpecialty(String specialty) {
    _doctorInfoDAO.saveDoctorSpecialty(specialty);
  }

  void saveDoctorQualification(String qualification) {
    _doctorInfoDAO.saveDoctorQualification(qualification);
  }

  void savePatientID(String id) {
    _doctorInfoDAO.savePatientID(id);
  }

  void saveCurrentHospitalID(String id) {
    _doctorInfoDAO.saveCurrentHospitalID(id);
  }

  void savePhone(String phone) {
    _doctorInfoDAO.savePhone(phone);
  }

  void saveDate(String date) {
    _doctorInfoDAO.saveDate(date);
  }

  void saveHospitalName(String name) {
    _doctorInfoDAO.saveHospitalName(name);
  }

  //check
  bool get isToken => _doctorInfoDAO.getToken;
  bool get isPatientID => _doctorInfoDAO.isPatientID;
  bool get isHospitalID => _doctorInfoDAO.isHospitalId;

  //get doctor data
  String get getDoctorName => _doctorInfoDAO.getDoctorName ?? '';
  String get getDoctorToken => _doctorInfoDAO.getDoctorToken ?? '';
  String get getPatientID => _doctorInfoDAO.getPatientID ?? '';
  String get getCurrentHospitalID => _doctorInfoDAO.getCurrentHospitalID ?? '';
  String get getDoctorID => _doctorInfoDAO.getDoctorID ?? '';
  String get getPhone => _doctorInfoDAO.getPhone ?? '';
  String get getEmail => _doctorInfoDAO.getEmail ?? '';
  String get getQualification => _doctorInfoDAO.getQualification ?? '';
  String get getSpecialty => _doctorInfoDAO.getSpecialty ?? '';
  String get getDate => _doctorInfoDAO.getDate ?? '';
  String get getHospitalName => _doctorInfoDAO.getHospitalName ?? '';

  //remove doctor data
  void removeToken() {
    _doctorInfoDAO.removeToken();
  }

  void removeDoctorID() {
    _doctorInfoDAO.removeID();
  }

  void removeDoctorName() {
    _doctorInfoDAO.removeName();
  }

  void removeDoctorEmail() {
    _doctorInfoDAO.removeEmail();
  }

  void removeDoctorNRC() {
    _doctorInfoDAO.removeNRC();
  }

  void removeDoctorSpecialty() {
    _doctorInfoDAO.removeSpecialty();
  }

  void removeDoctorQualification() {
    _doctorInfoDAO.removeQualification();
  }

  void removePatientID() {
    _doctorInfoDAO.removePatientID();
  }
}
