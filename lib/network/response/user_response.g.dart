// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['msg'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'msg': instance.msg,
    };
