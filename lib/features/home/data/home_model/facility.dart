import 'package:equatable/equatable.dart';

class Facility extends Equatable {
  final int? id;
  final int? facilityId;
  final String? facilityName;
  final String? facilityImage;

  const Facility({
    this.id,
    this.facilityId,
    this.facilityName,
    this.facilityImage,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json['id'] as int?,
        facilityId: json['facility_id'] as int?,
        facilityName: json['facility_name'] as String?,
        facilityImage: json['facility_image'] as String?,
      );

  @override
  List<Object?> get props {
    return [
      id,
      facilityId,
      facilityName,
      facilityImage,
    ];
  }
}
