import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    required this.status,
    required this.messageKey,
    required this.message,
    required this.data,
    required this.requestId,
  });

  final String status;
  final String messageKey;
  final String message;
  final ProfileDetailsData data;
  final String requestId;

  UserProfile copyWith({
    String? status,
    String? messageKey,
    String? message,
    ProfileDetailsData? data,
    String? requestId,
  }) =>
      UserProfile(
        status: status ?? this.status,
        messageKey: messageKey ?? this.messageKey,
        message: message ?? this.message,
        data: data ?? this.data,
        requestId: requestId ?? this.requestId,
      );

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        status: json["status"],
        messageKey: json["message_key"],
        message: json["message"],
        data: ProfileDetailsData.fromJson(json["data"]),
        requestId: json["request-id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message_key": messageKey,
        "message": message,
        "data": data.toJson(),
        "request-id": requestId,
      };
}

class ProfileDetailsData {
  ProfileDetailsData({
    required this.email,
    required this.fullName,
    required this.dob,
    required this.gender,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.bio,
    required this.profilePicture,
    required this.coverPhoto,
    required this.nationality,
    required this.roleInTeam,
    required this.player,
    required this.staff,
    required this.id,
    required this.kabId,
    required this.userType,
    required this.team,
    required this.teamJoined,
    required this.nationalityIso2,
    required this.countryIso2,
  });

  final String? email;
  final String? fullName;
  final String? dob;
  final String? gender;
  final String? phoneNumber;
  final String? country;
  final String? city;
  final String? bio;
  final String? profilePicture;
  final String? coverPhoto;
  final String? nationality;
  final String? roleInTeam;
  final String? player;
  final String? staff;
  final String? id;
  final String? kabId;
  final String? userType;
  final dynamic team;
  final dynamic teamJoined;
  final dynamic nationalityIso2;
  final dynamic countryIso2;

  ProfileDetailsData copyWith({
    String? email,
    String? fullName,
    String? dob,
    String? gender,
    String? phoneNumber,
    String? country,
    String? city,
    String? bio,
    String? profilePicture,
    String? coverPhoto,
    String? nationality,
    String? roleInTeam,
    String? player,
    String? staff,
    String? id,
    String? kabId,
    String? userType,
    dynamic team,
    dynamic teamJoined,
    dynamic nationalityIso2,
    dynamic countryIso2,
  }) =>
      ProfileDetailsData(
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        country: country ?? this.country,
        city: city ?? this.city,
        bio: bio ?? this.bio,
        profilePicture: profilePicture ?? this.profilePicture,
        coverPhoto: coverPhoto ?? this.coverPhoto,
        nationality: nationality ?? this.nationality,
        roleInTeam: roleInTeam ?? this.roleInTeam,
        player: player ?? this.player,
        staff: staff ?? this.staff,
        id: id ?? this.id,
        kabId: kabId ?? this.kabId,
        userType: userType ?? this.userType,
        team: team ?? this.team,
        teamJoined: teamJoined ?? this.teamJoined,
        nationalityIso2: nationalityIso2 ?? this.nationalityIso2,
        countryIso2: countryIso2 ?? this.countryIso2,
      );

  factory ProfileDetailsData.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsData(
        email: json["email"],
        fullName: json["full_name"],
        dob: json["dob"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        country: json["country"],
        city: json["city"],
        bio: json["bio"],
        profilePicture: json["profile_picture"],
        coverPhoto: json["cover_photo"],
        nationality: json["nationality"],
        roleInTeam: json["role_in_team"],
        player: json["player"],
        staff: json["staff"],
        id: json["id"],
        kabId: json["kab_id"],
        userType: json["user_type"],
        team: json["team"],
        teamJoined: json["team_joined"],
        nationalityIso2: json["nationality_iso2"],
        countryIso2: json["country_iso2"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "full_name": fullName,
        "dob": dob,
        "gender": gender,
        "phone_number": phoneNumber,
        "country": country,
        "city": city,
        "bio": bio,
        "profile_picture": profilePicture,
        "cover_photo": coverPhoto,
        "nationality": nationality,
        "role_in_team": roleInTeam,
        "player": player,
        "staff": staff,
        "id": id,
        "kab_id": kabId,
        "user_type": userType,
        "team": team,
        "team_joined": teamJoined,
        "nationality_iso2": nationalityIso2,
        "country_iso2": countryIso2,
      };
}
