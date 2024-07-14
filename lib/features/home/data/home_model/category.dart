import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String? name;
  final dynamic image;
  final int? hasDirections;
  final int? hasContract;

  const Category({
    this.id,
    this.name,
    this.image,
    this.hasDirections,
    this.hasContract,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as dynamic,
        hasDirections: json['has_directions'] as int?,
        hasContract: json['has_contract'] as int?,
      );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      hasDirections,
      hasContract,
    ];
  }
}
