import 'package:doctor_booking/features/home/data/models/category.dart';

class DoctorModel {
    final int id;
    final String name;
    final String email;
    final String role;
    final String? profilePhotoPath;
    final String profilePhotoUrl;
    final DoctorDetails? details;

    DoctorModel({
        required this.id,
        required this.name,
        required this.email,
        required this.role,
        required this.profilePhotoPath,
        required this.profilePhotoUrl,
        required this.details,
    });

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        profilePhotoPath: json["profile_photo_path"],
        profilePhotoUrl: json["profile_photo_url"],
        details:json["doctor_details"] != null ?  DoctorDetails.fromJson(json["doctor_details"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "profile_photo_path": profilePhotoPath,
        "profile_photo_url": profilePhotoUrl,
        "doctor": details?.toJson(),
    };
}

class DoctorDetails {
    final int id;
    final int doctorId;
    final int categoryId;
    final dynamic patients;
    final int experience;
    final String biography;
    final int rating;
    final String status;
    final CategoryModel category;

    DoctorDetails({
        required this.id,
        required this.doctorId,
        required this.categoryId,
        required this.patients,
        required this.experience,
        required this.biography,
        required this.rating,
        required this.status,
        required this.category
    });

    factory DoctorDetails.fromJson(Map<String, dynamic> json) => DoctorDetails(
        id: json["id"],
        doctorId: json["doctor_id"],
        categoryId: json["category_id"],
        patients: json["patients"],
        experience: json["experience"],
        biography: json["biography"],
        rating: json["rating"],
        status: json["status"],
        category: CategoryModel.fromJson(json['category'])
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "category_id": categoryId,
        "patients": patients,
        "experience": experience,
        "biography": biography,
        "rating": rating,
        "status": status,
        "category" : category.toJson()

    };
}
