import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final int id;
    final String name;
    final String email;
    final String? profilePhotoPath;
    final String profilePhotoUrl;
    final UserDetails? userDetails;

    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.profilePhotoPath,
        required this.profilePhotoUrl,
        required this.userDetails,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profilePhotoPath: json["profile_photo_path"],
        profilePhotoUrl: json["profile_photo_url"],
        userDetails: json['user_details'] != null ? UserDetails.fromJson(json["user_details"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profile_photo_path": profilePhotoPath,
        "profile_photo_url": profilePhotoUrl,
        "user_details": userDetails?.toJson(),
    };
}

class UserDetails {
    final String? biography;
    final String status;

    UserDetails({
        required this.biography,
        required this.status,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        biography: json["biography"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "biography": biography,
        "status": status,
    };
}
