import 'package:equatable/equatable.dart';

import 'adv.dart';
import 'banner.dart';
import 'user_type.dart';

class HomeModelData extends Equatable {
  final List<Banner>? banners;
  final List<UserType>? userTypes;
  final List<Adv>? advs;

  const HomeModelData({this.banners, this.userTypes, this.advs});

  factory HomeModelData.fromJson(Map<String, dynamic> json) => HomeModelData(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
            .toList(),
        userTypes: (json['user_types'] as List<dynamic>?)
            ?.map((e) => UserType.fromJson(e as Map<String, dynamic>))
            .toList(),
        advs: (json['advs'] as List<dynamic>?)
            ?.map((e) => Adv.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  List<Object?> get props => [banners, userTypes, advs];
}
