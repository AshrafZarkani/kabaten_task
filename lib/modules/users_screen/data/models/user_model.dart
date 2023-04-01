import 'dart:convert';

/// status : "200"
/// message_key : "success"
/// message : "success"
/// data : [{"id":"aeca6a80-ba71-4aa8-a137-836613ea21e6","full_name":"D Mangolia (afeef)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"vNDuQN@gmail.com","user_type":"user","team":null,"team_joined":{"email":"afeefmangolia@gmail.com","kab_id":"T-9878462735","name":"afeef magolia Team","id":"19f70f34-9151-4e41-85b7-f0e8fdef6d47","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"bd5da20b-82e9-4095-8977-e5edb57b20ce","full_name":"Y Touré (omar)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"xxtLuO@gmail.com","user_type":"user","team":null,"team_joined":{"email":"omarbarcateam@gmail.com","kab_id":"T-8751768800","name":"omar barca Team","id":"39bf20c1-2493-475c-b780-3a646a17032c","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"1bcb50c4-ff6f-4dda-81cc-72f3f8e9a2e6","full_name":"C Metzelder (afeef)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"DFtnem@gmail.com","user_type":"user","team":null,"team_joined":{"email":"affefmadridteam@gmail.com","kab_id":"T-8291663004","name":"affef madrid Team","id":"c6431ece-af2a-4a13-8626-89c7a4770567","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"47de1c39-21db-4def-9438-66efd77a3b93","full_name":"D Mangolia (orabi)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"DgIhnn@gmail.com","user_type":"user","team":null,"team_joined":{"email":"orabimangolia@gmail.com","kab_id":"T-9763365854","name":"orabi magolia Team","id":"8b6115e3-673d-41bf-9e5b-2a1962303d74","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"f448bd32-2a2e-4154-a67f-e5f1f6efb684","full_name":"Apple User","name":null,"player":"Defensive Holding Midfielder","staff":"","profile_picture":"https://stg-images.kabaten.com/f448bd32-2a2e-4154-a67f-e5f1f6efb684/profile_picture/profile_picture.jpg","role_in_team":null,"email":"santiagotechera+apple@bixlabs.com","user_type":"player","team":null,"team_joined":{"email":null,"kab_id":"T-8016006601","name":"Barcelona","id":"5240204c-5d83-415c-af09-2cee4f377d36","est_date":null,"coach_name":"Bella","staff_phone_number":null,"country":"Gambia","city":"Kanifing","bio":null,"profile_picture":"https://stg-images.kabaten.com/5240204c-5d83-415c-af09-2cee4f377d36/profile_picture/profile_picture.jpg","cover_photo":null}},{"id":"a3b8be9c-697e-4cfb-8f83-dc19f15cb87e","full_name":"D Mangolia (afeef)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"pAuEow@gmail.com","user_type":"user","team":null,"team_joined":{"email":"afeefmangolia@gmail.com","kab_id":"T-9878462735","name":"afeef magolia Team","id":"19f70f34-9151-4e41-85b7-f0e8fdef6d47","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"86da6ed4-aab5-4603-914f-6077de661108","full_name":"D Buhtan b","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"ptAqUw@gmail.com","user_type":"user","team":null,"team_joined":{"email":"buhtanu20@gmail.com","kab_id":"T-3365913923","name":"buhtan u20 Team","id":"33b9a172-90fa-47b3-bfb6-cef5240c64b8","est_date":"20/11/1996","coach_name":"buhtan","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"a8572ded-4862-4784-8bb2-ee8bc122f2a2","full_name":"S Ehrebi (salsabeela)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"UheNmf@gmail.com","user_type":"user","team":null,"team_joined":{"email":"salsabeelajordan@gmail.com","kab_id":"T-3404301889","name":"salsabeela jordan Team","id":"3bde1769-0503-40ae-96fa-57fed3876536","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":"https://stg-images.kabaten.com/d5008de5-1b7a-43a0-98c4-e2ea07a7e3df/profile_picture/profile_picture.jpg","cover_photo":null}},{"id":"243f684e-f361-41fb-ae2d-56c0c776081b","full_name":"A Ahmad (orabi)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"WvJDcs@gmail.com","user_type":"user","team":null,"team_joined":{"email":"orabijordan@gmail.com","kab_id":"T-9166833723","name":"orabi jordan Team","id":"01c07fac-3639-4cdc-8020-6128e574030b","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"c593b814-270f-4dcb-9a3b-2598f7b65c62","full_name":"D Buhtan r","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"pbVZXv@gmail.com","user_type":"user","team":null,"team_joined":{"email":"buhtanu20@gmail.com","kab_id":"T-3365913923","name":"buhtan u20 Team","id":"33b9a172-90fa-47b3-bfb6-cef5240c64b8","est_date":"20/11/1996","coach_name":"buhtan","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"267d3ebb-adaa-4ac0-816d-df0d6cec36c5","full_name":"D Mangolia (omar)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"IvZeVm@gmail.com","user_type":"user","team":null,"team_joined":{"email":"omarjordan@gmail.com","kab_id":"T-9106961585","name":"omar jordan Team","id":"c2cba627-a0cc-4c81-a4fb-0e74fe7ab52d","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"b2243414-3b6a-4991-aa17-d1c72ac4d921","full_name":"J Abbadi (jimmy)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"nlulqk@gmail.com","user_type":"user","team":null,"team_joined":{"email":"jimmyjordan@gmail.com","kab_id":"T-3842110119","name":"jimmy jordan Team","id":"b530a8a3-2121-48a9-9eeb-b8769cd5d34f","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"1cc84dfc-91e8-4d11-8eed-5274977a138e","full_name":"D Mangolia (jimmy)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"rhJprd@gmail.com","user_type":"user","team":null,"team_joined":{"email":"jimmymangolia@gmail.com","kab_id":"T-4936028196","name":"jimmy mangolia Team","id":"ce038c34-f01d-4020-b59a-5cbff7e27b3c","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"8d3c6e95-6b0b-4c21-9013-38b83fdfcd11","full_name":"D Mangolia (jimmy)","name":null,"player":null,"staff":null,"profile_picture":null,"role_in_team":null,"email":"ZeQWzf@gmail.com","user_type":"user","team":null,"team_joined":{"email":"jimmymangolia@gmail.com","kab_id":"T-4936028196","name":"jimmy mangolia Team","id":"ce038c34-f01d-4020-b59a-5cbff7e27b3c","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}},{"id":"17efe2a1-14bf-4012-8284-9ae47b037a2b","full_name":"Nour Hasan","name":null,"player":"","staff":"","profile_picture":null,"role_in_team":null,"email":"nouraldin95@yahoo.com","user_type":"user","team":null,"team_joined":null}]
/// meta : {"page":1,"page_size":15,"total_records":627,"total_pages":42,"next":2,"previous":null}
/// request-id : "staging-43f95ce1-1497-46d8-8978-78c229952216"
/// count : 627
/// next : 2
/// previous : null

UsersList usersListFromJson(String str) => UsersList.fromJson(json.decode(str));
String usersListToJson(UsersList data) => json.encode(data.toJson());

class UsersList {
  UsersList({
    this.status,
    this.messageKey,
    this.message,
    this.data,
    this.meta,
    this.requestid,
    this.count,
    this.next,
    this.previous,
  });

  UsersList.fromJson(dynamic json) {
    status = json['status'];
    messageKey = json['message_key'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UserData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    requestid = json['request-id'];
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
  }
  String? status;
  String? messageKey;
  String? message;
  List<UserData>? data;
  Meta? meta;
  String? requestid;
  int? count;
  int? next;
  dynamic previous;
  UsersList copyWith({
    String? status,
    String? messageKey,
    String? message,
    List<UserData>? data,
    Meta? meta,
    String? requestid,
    int? count,
    int? next,
    dynamic previous,
  }) =>
      UsersList(
        status: status ?? this.status,
        messageKey: messageKey ?? this.messageKey,
        message: message ?? this.message,
        data: data ?? this.data,
        meta: meta ?? this.meta,
        requestid: requestid ?? this.requestid,
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message_key'] = messageKey;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['request-id'] = requestid;
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    return map;
  }
}

/// page : 1
/// page_size : 15
/// total_records : 627
/// total_pages : 42
/// next : 2
/// previous : null

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());

class Meta {
  Meta({
    this.page,
    this.pageSize,
    this.totalRecords,
    this.totalPages,
    this.next,
    this.previous,
  });

  Meta.fromJson(dynamic json) {
    page = json['page'];
    pageSize = json['page_size'];
    totalRecords = json['total_records'];
    totalPages = json['total_pages'];
    next = json['next'];
    previous = json['previous'];
  }
  int? page;
  int? pageSize;
  int? totalRecords;
  int? totalPages;
  int? next;
  dynamic previous;
  Meta copyWith({
    int? page,
    int? pageSize,
    int? totalRecords,
    int? totalPages,
    int? next,
    dynamic previous,
  }) =>
      Meta(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        totalRecords: totalRecords ?? this.totalRecords,
        totalPages: totalPages ?? this.totalPages,
        next: next ?? this.next,
        previous: previous ?? this.previous,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['page_size'] = pageSize;
    map['total_records'] = totalRecords;
    map['total_pages'] = totalPages;
    map['next'] = next;
    map['previous'] = previous;
    return map;
  }
}

/// id : "aeca6a80-ba71-4aa8-a137-836613ea21e6"
/// full_name : "D Mangolia (afeef)"
/// name : null
/// player : null
/// staff : null
/// profile_picture : null
/// role_in_team : null
/// email : "vNDuQN@gmail.com"
/// user_type : "user"
/// team : null
/// team_joined : {"email":"afeefmangolia@gmail.com","kab_id":"T-9878462735","name":"afeef magolia Team","id":"19f70f34-9151-4e41-85b7-f0e8fdef6d47","est_date":"20/11/1996","coach_name":"Abd","staff_phone_number":null,"country":"Jordan","city":"Amman","bio":null,"profile_picture":null,"cover_photo":null}

UserData dataFromJson(String str) => UserData.fromJson(json.decode(str));
String dataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.id,
    this.fullName,
    this.name,
    this.player,
    this.staff,
    this.profilePicture,
    this.roleInTeam,
    this.email,
    this.userType,
    this.team,
    this.teamJoined,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    name = json['name'];
    player = json['player'];
    staff = json['staff'];
    profilePicture = json['profile_picture'];
    roleInTeam = json['role_in_team'];
    email = json['email'];
    userType = json['user_type'];
    team = json['team'];
    teamJoined = json['team_joined'] != null
        ? TeamJoined.fromJson(json['team_joined'])
        : null;
  }
  String? id;
  String? fullName;
  dynamic name;
  dynamic player;
  dynamic staff;
  dynamic profilePicture;
  dynamic roleInTeam;
  String? email;
  String? userType;
  dynamic team;
  TeamJoined? teamJoined;
  UserData copyWith({
    String? id,
    String? fullName,
    dynamic name,
    dynamic player,
    dynamic staff,
    dynamic profilePicture,
    dynamic roleInTeam,
    String? email,
    String? userType,
    dynamic team,
    TeamJoined? teamJoined,
  }) =>
      UserData(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        name: name ?? this.name,
        player: player ?? this.player,
        staff: staff ?? this.staff,
        profilePicture: profilePicture ?? this.profilePicture,
        roleInTeam: roleInTeam ?? this.roleInTeam,
        email: email ?? this.email,
        userType: userType ?? this.userType,
        team: team ?? this.team,
        teamJoined: teamJoined ?? this.teamJoined,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['name'] = name;
    map['player'] = player;
    map['staff'] = staff;
    map['profile_picture'] = profilePicture;
    map['role_in_team'] = roleInTeam;
    map['email'] = email;
    map['user_type'] = userType;
    map['team'] = team;
    if (teamJoined != null) {
      map['team_joined'] = teamJoined?.toJson();
    }
    return map;
  }
}

/// email : "afeefmangolia@gmail.com"
/// kab_id : "T-9878462735"
/// name : "afeef magolia Team"
/// id : "19f70f34-9151-4e41-85b7-f0e8fdef6d47"
/// est_date : "20/11/1996"
/// coach_name : "Abd"
/// staff_phone_number : null
/// country : "Jordan"
/// city : "Amman"
/// bio : null
/// profile_picture : null
/// cover_photo : null

TeamJoined teamJoinedFromJson(String str) =>
    TeamJoined.fromJson(json.decode(str));
String teamJoinedToJson(TeamJoined data) => json.encode(data.toJson());

class TeamJoined {
  TeamJoined({
    this.email,
    this.kabId,
    this.name,
    this.id,
    this.estDate,
    this.coachName,
    this.staffPhoneNumber,
    this.country,
    this.city,
    this.bio,
    this.profilePicture,
    this.coverPhoto,
  });

  TeamJoined.fromJson(dynamic json) {
    email = json['email'];
    kabId = json['kab_id'];
    name = json['name'];
    id = json['id'];
    estDate = json['est_date'];
    coachName = json['coach_name'];
    staffPhoneNumber = json['staff_phone_number'];
    country = json['country'];
    city = json['city'];
    bio = json['bio'];
    profilePicture = json['profile_picture'];
    coverPhoto = json['cover_photo'];
  }
  String? email;
  String? kabId;
  String? name;
  String? id;
  String? estDate;
  String? coachName;
  dynamic staffPhoneNumber;
  String? country;
  String? city;
  dynamic bio;
  dynamic profilePicture;
  dynamic coverPhoto;
  TeamJoined copyWith({
    String? email,
    String? kabId,
    String? name,
    String? id,
    String? estDate,
    String? coachName,
    dynamic staffPhoneNumber,
    String? country,
    String? city,
    dynamic bio,
    dynamic profilePicture,
    dynamic coverPhoto,
  }) =>
      TeamJoined(
        email: email ?? this.email,
        kabId: kabId ?? this.kabId,
        name: name ?? this.name,
        id: id ?? this.id,
        estDate: estDate ?? this.estDate,
        coachName: coachName ?? this.coachName,
        staffPhoneNumber: staffPhoneNumber ?? this.staffPhoneNumber,
        country: country ?? this.country,
        city: city ?? this.city,
        bio: bio ?? this.bio,
        profilePicture: profilePicture ?? this.profilePicture,
        coverPhoto: coverPhoto ?? this.coverPhoto,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['kab_id'] = kabId;
    map['name'] = name;
    map['id'] = id;
    map['est_date'] = estDate;
    map['coach_name'] = coachName;
    map['staff_phone_number'] = staffPhoneNumber;
    map['country'] = country;
    map['city'] = city;
    map['bio'] = bio;
    map['profile_picture'] = profilePicture;
    map['cover_photo'] = coverPhoto;
    return map;
  }
}
