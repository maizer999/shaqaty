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
  });
}
