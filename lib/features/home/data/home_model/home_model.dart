import 'package:equatable/equatable.dart';

import 'home_model_data.dart';

class HomeModel extends Equatable {
  final HomeModelData? data;
  final String message;
  final bool status;

  const HomeModel({this.data, required this.message, required this.status});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: json['data'] == null
            ? null
            : HomeModelData.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String,
        status: json['status'] as bool,
      );

  @override
  List<Object?> get props => [data, message, status];
}
