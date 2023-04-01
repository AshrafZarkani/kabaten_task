import 'dart:convert';

AuthError authErrorFromJson(String str) => AuthError.fromJson(json.decode(str));

String authErrorToJson(AuthError data) => json.encode(data.toJson());

class AuthError {
  AuthError({
    required this.detail,
  });

  final List<Detail> detail;

  AuthError copyWith({
    List<Detail>? detail,
  }) =>
      AuthError(
        detail: detail ?? this.detail,
      );

  factory AuthError.fromJson(Map<String, dynamic> json) => AuthError(
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    required this.loc,
    required this.msg,
    required this.type,
  });

  final List<String> loc;
  final String msg;
  final String type;

  Detail copyWith({
    List<String>? loc,
    String? msg,
    String? type,
  }) =>
      Detail(
        loc: loc ?? this.loc,
        msg: msg ?? this.msg,
        type: type ?? this.type,
      );

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        loc: List<String>.from(json["loc"].map((x) => x)),
        msg: json["msg"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "loc": List<dynamic>.from(loc.map((x) => x)),
        "msg": msg,
        "type": type,
      };
}
