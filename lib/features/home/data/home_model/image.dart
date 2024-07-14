import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final int? id;
  final String? image;

  const Image({this.id, this.image});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as int?,
        image: json['image'] as String?,
      );

  @override
  List<Object?> get props => [id, image];
}
