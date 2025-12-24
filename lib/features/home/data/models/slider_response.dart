// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_mappable/dart_mappable.dart';

part 'slider_response.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class HomeSliderResponse with HomeSliderResponseMappable {
  final bool? error;
  final dynamic message;
  final List<HomeSliderItem>? data;
  final int? code;

  const HomeSliderResponse({
    this.error,
    this.message,
    this.data,
    this.code,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class HomeSliderItem with HomeSliderItemMappable {
  final int? id;
  final String? image;
  final String? sequence;
  final String? thirdPartyLink;
  final String? createdAt;
  final String? updatedAt;
  final String? modelType;
  final int? modelId;
  final SliderModelItem? model;

  const HomeSliderItem({
    this.id,
    this.image,
    this.sequence,
    this.thirdPartyLink,
    this.createdAt,
    this.updatedAt,
    this.modelType,
    this.modelId,
    this.model,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class SliderModelItem with SliderModelItemMappable {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final double? price;
  final double? minSalary;
  final double? maxSalary;
  final String? image;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? contact;
  final int? showOnlyToPremium;
  final String? status;
  final String? rejectedReason;
  final String? videoLink;
  final String? city;
  final String? state;
  final String? country;
  final int? areaId;
  final int? userId;
  final int? soldTo;
  final int? categoryId;
  final String? allCategoryIds;
  final String? expiryDate;
  final int? clicks;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? isEditedByAdmin;
  final String? adminEditReason;
  final int? packageId;
  final String? translatedName;
  final String? translatedDescription;
  final List<dynamic>? translations;

  const SliderModelItem({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.minSalary,
    this.maxSalary,
    this.image,
    this.latitude,
    this.longitude,
    this.address,
    this.contact,
    this.showOnlyToPremium,
    this.status,
    this.rejectedReason,
    this.videoLink,
    this.city,
    this.state,
    this.country,
    this.areaId,
    this.userId,
    this.soldTo,
    this.categoryId,
    this.allCategoryIds,
    this.expiryDate,
    this.clicks,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isEditedByAdmin,
    this.adminEditReason,
    this.packageId,
    this.translatedName,
    this.translatedDescription,
    this.translations,
  });
}
