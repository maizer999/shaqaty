// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_mappable/dart_mappable.dart';

part 'sub_category_response.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class SubCategoryResponse with SubCategoryResponseMappable {
  final bool? error;
  final String? message;
  final SubCategoryData? data;
  final int? code;

  const SubCategoryResponse({
    this.error,
    this.message,
    this.data,
    this.code,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class SubCategoryData with SubCategoryDataMappable {
  final int? currentPage;
  final List<SubCategoryItem>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final int? prevPageUrl;
  final int? to;
  final int? total;
  final int? totalItemCount;

  const SubCategoryData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
    this.totalItemCount,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class SubCategoryItem with SubCategoryItemMappable {
  final int? id;
  final String? name;
  final String? slug;
  final String? description;
  final double? price;
  final String? image;
  final String? city;
  final String? state;
  final String? country;
  final int? categoryId;
  final String? allCategoryIds;
  final String? createdAt;
  final String? updatedAt;
  final int? isEditedByAdmin;
  final String? adminEditReason;

  // new fields
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? contact;
  final int? showOnlyToPremium;
  final String? status;
  final String? rejectedReason;
  final String? videoLink;
  final Map<String, dynamic>? user;
  final Map<String, dynamic>? category;
  final List<dynamic>? galleryImages;
  final List<dynamic>? featuredItems;
  final bool? isFeature;
  final int? totalLikes;
  final bool? isLiked;
  final TranslatedItem? translatedItem;

  const SubCategoryItem({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.image,
    this.city,
    this.state,
    this.country,
    this.categoryId,
    this.allCategoryIds,
    this.createdAt,
    this.updatedAt,
    this.isEditedByAdmin,
    this.adminEditReason,
    this.latitude,
    this.longitude,
    this.address,
    this.contact,
    this.showOnlyToPremium,
    this.status,
    this.rejectedReason,
    this.videoLink,
    this.user,
    this.category,
    this.galleryImages,
    this.featuredItems,
    this.isFeature,
    this.totalLikes,
    this.isLiked,
    this.translatedItem,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class TranslatedItem with TranslatedItemMappable {
  final String? name;
  final String? description;
  final String? address;
  final String? rejectedReason;
  final String? adminEditReason;
  final String? city;
  final String? state;
  final String? country;

  const TranslatedItem({
    this.name,
    this.description,
    this.address,
    this.rejectedReason,
    this.adminEditReason,
    this.city,
    this.state,
    this.country,
  });
}
