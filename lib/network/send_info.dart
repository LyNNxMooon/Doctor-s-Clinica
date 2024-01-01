import 'package:json_annotation/json_annotation.dart';
part 'send_info.g.dart';

@JsonSerializable()
class SendInfo {
  @JsonKey(name: "doctor_email")
  final String doctorEmail;
  final String password;

  SendInfo({required this.doctorEmail, required this.password});

  Map<String, dynamic> toJson() => _$SendInfoToJson(this);
}
