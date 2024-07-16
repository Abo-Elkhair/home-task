import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  final String? image;

  const Banners({this.image});

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        image: json['image'] as String?,
      );

  @override
  List<Object?> get props => [image];
}
