import 'package:equatable/equatable.dart';

class Option extends Equatable {
  final int? id;
  final int? categoryOptionId;
  final String? value;
  final String? name;
  final String? type;
  final dynamic image;
  final dynamic categoryOptions;

  const Option({
    this.id,
    this.categoryOptionId,
    this.value,
    this.name,
    this.type,
    this.image,
    this.categoryOptions,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json['id'] as int?,
        categoryOptionId: json['category_option_id'] as int?,
        value: json['value'] as String?,
        name: json['name'] as String?,
        type: json['type'] as String?,
        image: json['image'] as dynamic,
        categoryOptions: json['category_options'] as dynamic,
      );

  @override
  List<Object?> get props {
    return [
      id,
      categoryOptionId,
      value,
      name,
      type,
      image,
      categoryOptions,
    ];
  }
}
