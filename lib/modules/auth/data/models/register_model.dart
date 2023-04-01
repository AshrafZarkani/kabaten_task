// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.status,
    this.messageKey,
    this.message,
    this.data,
  });

  final String? status;
  final String? messageKey;
  final String? message;
  final RegisterModelData? data;

  RegisterModel copyWith({
    String? status,
    String? messageKey,
    String? message,
    RegisterModelData? data,
  }) =>
      RegisterModel(
        status: status ?? this.status,
        messageKey: messageKey ?? this.messageKey,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        messageKey: json["message_key"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : RegisterModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message_key": messageKey,
        "message": message,
        "data": data?.toJson(),
      };
}

class RegisterModelData {
  RegisterModelData({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
  });

  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;

  RegisterModelData copyWith({
    String? accessToken,
    String? refreshToken,
    String? tokenType,
  }) =>
      RegisterModelData(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        tokenType: tokenType ?? this.tokenType,
      );

  factory RegisterModelData.fromJson(Map<String, dynamic> json) =>
      RegisterModelData(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "token_type": tokenType,
      };
}
