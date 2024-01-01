import 'package:clinica_doctor/network/response/user_info_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String? token;
  final UserInfoResponse? user;
  final String? msg;

  UserResponse(this.msg, {required this.token, required this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
