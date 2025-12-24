// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_mappable/dart_mappable.dart';

part 'category_response.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class CategoryResponse with CategoryResponseMappable {
  final bool? error;
  final dynamic message;
  final CategoryData? data;
  final int? code;
  final dynamic selfCategory;

  const CategoryResponse({
    this.error,
    this.message,
    this.data,
    this.code,
    this.selfCategory,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class CategoryData with CategoryDataMappable {
  final int? currentPage;
  final List<CategoryItem>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<CategoryLink>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  const CategoryData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class CategoryItem with CategoryItemMappable {
  final int? id;
  final int? sequence;
  final String? name;
  final String? image;
  final int? parentCategoryId;
  final String? description;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final String? slug;
  final int? isJobCategory;
  final int? priceOptional;
  final int? subcategoriesCount;
  final int? allItemsCount;
  final String? translatedName;
  final String? translatedDescription;
  final List<dynamic>? translations;
  final List<CategoryItem>? subcategories;

  const CategoryItem({
    this.id,
    this.sequence,
    this.name,
    this.image,
    this.parentCategoryId,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.isJobCategory,
    this.priceOptional,
    this.subcategoriesCount,
    this.allItemsCount,
    this.translatedName,
    this.translatedDescription,
    this.translations,
    this.subcategories,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class CategoryLink with CategoryLinkMappable {
  final String? url;
  final String? label;
  final bool? active;

  const CategoryLink({
    this.url,
    this.label,
    this.active,
  });
}
