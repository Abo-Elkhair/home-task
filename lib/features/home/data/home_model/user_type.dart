import 'package:equatable/equatable.dart';

class UserType extends Equatable {
  final int? id;
  final String? name;

  const UserType({this.id, this.name});

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  @override
  List<Object?> get props => [id, name];
}
