import 'package:equatable/equatable.dart';

import 'category.dart';
import 'facility.dart';
import 'image.dart';
import 'option.dart';
import 'owner.dart';
import 'region.dart';
import 'street.dart';

class Adv extends Equatable {
  final String? productNum;
  final int? id;
  final String? mainImage;
  final String? title;
  final String? desc;
  final String? addressDetails;
  final double? addressLat;
  final double? addressLng;
  final int? price;
  final int? totalArea;
  final double? pricePerMeter;
  final int? deposite;
  final String? status;
  final String? statusText;
  final String? reservationStatus;
  final String? advertiserType;
  final String? advertiserTypeText;
  final Owner? owner;
  final Region? region;
  final Category? category;
  final List<Option>? options;
  final List<Facility>? facilities;
  final List<Image>? images;
  final List<Street>? streets;
  final String? contract;
  final bool? isMine;
  final dynamic refuseReason;
  final bool? isFav;
  final String? createdAt;

  const Adv({
    this.productNum,
    this.id,
    this.mainImage,
    this.title,
    this.desc,
    this.addressDetails,
    this.addressLat,
    this.addressLng,
    this.price,
    this.totalArea,
    this.pricePerMeter,
    this.deposite,
    this.status,
    this.statusText,
    this.reservationStatus,
    this.advertiserType,
    this.advertiserTypeText,
    this.owner,
    this.region,
    this.category,
    this.options,
    this.facilities,
    this.images,
    this.streets,
    this.contract,
    this.isMine,
    this.refuseReason,
    this.isFav,
    this.createdAt,
  });

  factory Adv.fromJson(Map<String, dynamic> json) => Adv(
        productNum: json['product_num'] as String?,
        id: json['id'] as int?,
        mainImage: json['main_image'] as String?,
        title: json['title'] as String?,
        desc: json['desc'] as String?,
        addressDetails: json['address_details'] as String?,
        addressLat: (json['address_lat'] as num?)?.toDouble(),
        addressLng: (json['address_lng'] as num?)?.toDouble(),
        price: json['price'] as int?,
        totalArea: json['total_area'] as int?,
        pricePerMeter: (json['price_per_meter'] as num?)?.toDouble(),
        deposite: json['deposite'] as int?,
        status: json['status'] as String?,
        statusText: json['status_text'] as String?,
        reservationStatus: json['reservation_status'] as String?,
        advertiserType: json['advertiser_type'] as String?,
        advertiserTypeText: json['advertiser_type_text'] as String?,
        owner: json['owner'] == null
            ? null
            : Owner.fromJson(json['owner'] as Map<String, dynamic>),
        region: json['region'] == null
            ? null
            : Region.fromJson(json['region'] as Map<String, dynamic>),
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        options: (json['options'] as List<dynamic>?)
            ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
        facilities: (json['facilities'] as List<dynamic>?)
            ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
            .toList(),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        streets: (json['streets'] as List<dynamic>?)
            ?.map((e) => Street.fromJson(e as Map<String, dynamic>))
            .toList(),
        contract: json['contract'] as String?,
        isMine: json['is_mine'] as bool?,
        refuseReason: json['refuse_reason'] as dynamic,
        isFav: json['is_fav'] as bool?,
        createdAt: json['created_at'] as String?,
      );

  @override
  List<Object?> get props {
    return [
      productNum,
      id,
      mainImage,
      title,
      desc,
      addressDetails,
      addressLat,
      addressLng,
      price,
      totalArea,
      pricePerMeter,
      deposite,
      status,
      statusText,
      reservationStatus,
      advertiserType,
      advertiserTypeText,
      owner,
      region,
      category,
      options,
      facilities,
      images,
      streets,
      contract,
      isMine,
      refuseReason,
      isFav,
      createdAt,
    ];
  }
}
